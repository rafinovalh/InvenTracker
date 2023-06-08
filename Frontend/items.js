document.addEventListener('DOMContentLoaded', function() {
    axios.get('/it/showitem')
      .then(function(response) {
        if (response.data.message === 'Items found') {
          var items = response.data.showItems;
          for (var i = 0; i < items.length; i++) {
            var item = items[i];
            var date = new Date(item.dateadded);
            var formattedDate = date.toLocaleDateString('en-US', { year: 'numeric', month: 'short', day: 'numeric' });
            var row = '<tr><td>' + item.itemid + '</td><td>' + item.name + '</td><td>' + item.quantity + '</td><td>' + item.category + '</td><td>' + item.locationid + '</td><td>' + formattedDate + '</td></tr>';
            document.getElementById('itemTable').getElementsByTagName('tbody')[0].innerHTML += row;
          }
        } else {
          var noItemsRow = '<tr><td colspan="4">No items found</td></tr>';
          document.getElementById('itemTable').getElementsByTagName('tbody')[0].innerHTML = noItemsRow;
        }
      })
      .catch(function(error) {
        console.log(error);
      });
  });