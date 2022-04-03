#!/usr/bin/env python3

import anytree
import itertools


hold_relations_sa = [28, 64, 65, 66, 67, 76, 77, 80, 97, 1002]


def create_tree(data):
    '''Creates an 'anytree' object representation of the dependency tree'''

    nodes = []
    roots = []
    for ind, fields in data.iterrows():
        node = anytree.Node(
            ind,
            r_id=fields.r_id,
            p_id=fields.p_id)
        if fields.p_id == 0:
            roots.append(node)
        else:
            nodes.append(node)
    trees = []
    for root in roots:
        tree = add_children(root, nodes)
        trees.append(tree)
    return trees


def add_children(root, nodes):
    '''Recursively create edges between parent and children'''

    children = []
    for node in nodes:
        if node.p_id == root.name:
            children.append(node)
    root.children = children
    for child in children:
        add_children(child, nodes)
    return root


def sort_tree(tree, prob_data):
    '''Sorts the children of each parent based on
    1. Learned couplet order probabilities
    2. Number of descendants (in descending order) and
    3. Original word order'''

    sorted_tree = anytree.Node(tree.root.name, r_id=0, p_id=0)
    for node in anytree.LevelOrderIter(tree):
        if node.is_leaf:
            continue
        children = node.children

        if len(children) == 1:
            child = children[0]
            parent = anytree.search.find(
                sorted_tree, lambda node: node.name == child.p_id)
            anytree.Node(
                child.name,
                r_id=child.r_id,
                p_id=child.p_id,
                parent=parent)
            continue

        perms = itertools.permutations(children)
        scores = []
        for seq in perms:
            prob_score, desc_score, order_score = \
                calculate_scores(seq, prob_data)
            scores.append((seq, prob_score, desc_score, order_score))
        scores.sort(reverse=True, key=lambda x: (x[1], x[2], x[3]))

        # [TODO] add an option to return multiple possible
        # anvaya sequences on user request. Refer old code.
        # Here, selects the best sequence only.
        best_seq = scores[0][0]

        for child in best_seq:
            parent = anytree.search.find(
                sorted_tree, lambda node: node.name == child.p_id)
            anytree.Node(
                child.name,
                r_id=child.r_id,
                p_id=child.p_id,
                parent=parent)

    return sorted_tree


def calculate_scores(seq, prob_data):
    '''Calculates scores of a node sequence
    1. Probability score - from learned couple probability,
    2. Descendant score - comparing number of descendants of nodes and
    3. Order score - similarity of the sequence with original input order.'''

    prob_score = 1
    desc_score = 0
    order_score = 0
    couples = itertools.combinations(seq, 2)

    for couple in couples:
        one = couple[0]
        two = couple[1]

        # If relations are the same or if the couplet is not found
        # in the learned probabilities list, the probability score is 0.5
        # Otherwise, gets probability score from the learned probabilities
        if one.r_id == two.r_id or (one.r_id, two.r_id) not in prob_data:
            prob_score *= 0.5
        else:
            prob_score *= prob_data[(one.r_id, two.r_id)]

        # If first chunk is heavier than the second, score increments
        # If the second chunk is heavier, score decrements as a penalty
        if len(one.descendants) > len(two.descendants):
            desc_score += 1
        elif len(one.descendants) < len(two.descendants):
            desc_score -= 1

        # If node IDs are in ascending order (ie. in original input order),
        # score increments. Or if IDs are in reverse order, score decrements
        if one.name < two.name:
            order_score += 1
        else:
            order_score -= 1

    return prob_score, desc_score, order_score


def linear_order_sa(tree):
    '''Linearizes the tree into Sanskrit word order'''

    held_back = {}
    word_order = []
    for node in anytree.PostOrderIter(tree):
        # Hold relations which can't be traversed using post order iteration
        # like _xyowakaH, sambanXaH etc. They will be inserted into the word
        # order after their parent node. Subtrees having multiples of such
        # relations like 'ca eva' are dealt reverse traversing from the leaf.
        if node.is_leaf and node.r_id in hold_relations_sa:
            held_seq = []
            for hold_check in node.iter_path_reverse():
                if hold_check.r_id in hold_relations_sa:
                    held_seq.insert(0, [hold_check.p_id, hold_check.name])
                else:
                    break
            held_back[held_seq[0][0]] = [x[1] for x in held_seq]
        elif node.name in [x for v in held_back.values() for x in v]:
            continue
        else:
            word_order.append(node.name)
            if node.name in held_back:
                word_order.extend(held_back[node.name])
                del held_back[node.name]
    return word_order
