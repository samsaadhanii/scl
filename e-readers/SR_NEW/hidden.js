     function toggleChildren(id) {
      const children = document.getElementById(id);
      if (children.classList.contains('myhidden')) {
        children.classList.remove('myhidden');
      } else {
        children.classList.add('myhidden');
      }
    }
