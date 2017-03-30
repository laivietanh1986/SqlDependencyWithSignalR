$(function () {
    var notifications = $.connection.messageHub;
    notifications.client.hello = function () {
        alert("hello");
    };
    notifications.client.updatedata = function () {
        getData();
    }
    $.connection.hub.start().done(function () {
        console.log("connect");
        getData();
    }).fail(function () {

    });
});

function getData() {
    var tbl = $('#messageTable');
    $.ajax({
        url: "/Home/GetBlog",
        method: "POST"
    }).done(function (data) {
        tbl.empty().html(data);
    });
}