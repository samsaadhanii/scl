# NOTES and TODO

> Catch errors and list exception. In the current version, no errors are catched

## Input

* Read from
  - ~~CSV/TSV~~
  - ~~XLSX~~
  - SKT_TEMP's parseop1.txt

* Deal with input files with multiple trees in it. Simple loops should work.

* Relation list file
  - Hard link in code
    + ~~Include a local copy~~
    + Symlink to original location
  - Provide as a command line argument
  - _If a local copy of relations.txt is hard linked, should I also mark the relations to hold back while linearizing traversal in it?_

* Couplet probability file
  - ~~Hard link in code~~
  - Provide as a command line argument

## Sorting

* Indian languages
  - ~~Primary: learned couplet probability data~~
  - ~~Secondary: number of descendants of nodes (heavier to lighter)~~
  - ~~Tertiary: the original input order~~

* Foreign languages
  - Still to decide whether a separate sorting algorithm is needed. A custom linearization traversal should handle it

* Multiple prose orders
  - Discard orders having very low or zero probability
  - Rank multiple orders
  - Add a command line argument to mention the number of orders to output.
  - ~~Default is the best order.~~

* Old algorithm
  - Include old module which sorts based on manually provided relation weights
  - A command line argument to choose between old and new algorithm
  - It can also be used it for testing and evaluation

## Linearization

* Target languages
  - Sanskrit
    - ~~Deal with _dhyotaka relations~~
    - Deal with samuccita joining two sentences
    - Ordering between subtrees of nityasambandhas
  - Hindi
  - Malayalam
  - Telugu
  - Marathi
  - English
  - German
  - French

* A simple script to compare the changes in SCL's `relations.txt` and update the list of relations being held back.