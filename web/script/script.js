window.onload = function() {
    /*
    var rows = document.getElementsByTagName("tr");
    var id = 0;
    console.log(rows);
    for (var i = 0; i < rows.length; i++) {
        console.log('i: ' + i);
        rows[i].addEventListener('click', function() {
            formInformation(id);
            console.log(id);
            id++;
        });
    }
    */

    var firstRow = document.getElementById('100');
    if (firstRow != null) {
        firstRow.addEventListener('click', function() {
            formInformation(100);
        })
    }

    var secondRow = document.getElementById('101');
    if (secondRow != null) {
        secondRow.addEventListener('click', function() {
            formInformation(101);
        })
    }

    document.getElementById('101').addEventListener('click', function() {
        formInformation(101);
    });
}

function formInformation(id) {
    /*
    var i = parseInt(id);
    console.log('i, form: ' + i);
    console.log('id: ' + id);
    */
    var row = document.getElementById(id).innerText;
    var rowContent = row.split("\t");
    console.log(rowContent);
    $('#taskNameInChange').val(rowContent[1]);
    $('#descriptionInChange').val(rowContent[2]);
    $('#noteInChange').val(rowContent[3]);
    $('#doneInChange').val(rowContent[0]);
    $('#taskId').val(rowContent[4]);
    $('#changeTodo').modal();
}
