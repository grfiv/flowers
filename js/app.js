// Initialize app
var myApp = new Framework7();

// If we need to use custom DOM library, let's save it to $$ variable:
var $$ = Dom7;

// Add view
var mainView = myApp.addView('.view-main', {
    // Because we want to use dynamic navbar, we need to enable it for this view:
    dynamicNavbar: true
});

var mySearchbar = myApp.searchbar('.searchbar', {
    searchList: '.list-block-search',
    searchIn: '.item-title'
});


// =======================================================================
// LOAD THE SQLITE3 DATABASE FILE + BUILD LISTVIEW LIST
// https://github.com/kripken/sql.js/
// =======================================================================
var xhr = new XMLHttpRequest();
xhr.open('GET', 'data/flowers.sqlite3', true);
xhr.responseType = 'arraybuffer';

var db;               // global for database connection
//var itemlist;         // global for listview template
alert("pre");
xhr.onload = function () {
    // load the sqlite3 database file
    // -------------------------------
    var uInt8Array = new Uint8Array(this.response);
    db = new SQL.Database(uInt8Array);

    // display a list of tables on the console
    // ---------------------------------------
    var tbls = db.exec("SELECT * FROM sqlite_master where type='table';");
    console.log(tbls);



};
xhr.send();
alert("post");


var itemlist = [{
    title: 'zinnia and fubar',
    picture: 'zinnia.jpg',
    id: '1',
},
    {
        title: 'zinnia and snafu',
        picture: 'zinnia.jpg',
        id: '2',
    },
    // ...
    {
        title: 'klmno',
        picture: 'zinnia.jpg',
        id: '3',
    },];

var myList = myApp.virtualList('.list-block.virtual-list', {
    // Array with items data
    items: itemlist,

    // Template 7 template to render each item
    template: '<li class="item-content" id="{{id}}">' +
    '<div class="item-media"><div class="thumbnail"><img src="images300x300/{{picture}}"></div></div>' +
    '<div class="item-inner"><div class="item-title">{{title}}</div></div>' +
    '</li>',

    // search all items, we need to return array with indexes of matched items
    searchAll: function (query, items) {
        var foundItems = [];
        for (var i = 0; i < items.length; i++) {
            // Check if title contains query string
            if (items[i].title.indexOf(query.trim()) >= 0) foundItems.push(i);
        }
        // Return array with indexes of matched items
        return foundItems;
    }
});

$$('.searchbar-found').on('click', function (e) {
    console.log(e.path[2].id);
});

