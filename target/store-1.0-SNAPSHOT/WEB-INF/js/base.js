
$(document).ready(function() {
    $('.delete-btn').click(function() {
        var bookID = $(this).attr('data-id');
        var deleteUrl = 'book?action=delete&bookID=' + bookID;
        $('#deleteLink').attr('href', deleteUrl);
    });
});


$(document).ready(function() {
        $("#studentlist").validate({
            onfocusout: false,
            onkeyup: false,
            rules: {
                "StudentID": {
                    required: true,
                    maxlength: 10
                },
                "Name": {
                    required: true
                },
                "Age": {
                    required: true,
                    min: 1
                }
            },
            messages: {
                "StudentID": {
                    required: "Bắt buộc nhập StudentID",
                    maxlength: "Hãy nhập tối đa 10 ký tự"
                },
                "Name": {
                    required: "Bắt buộc nhập Name"
                },
                "Age": {
                    required: "Bắt buộc nhập Age",
                    min: "Hãy nhập ít nhất 1 số"
                }
            }
        });
    });

    $(document).ready(function() {
        $("#borrowlist").validate({
            onfocusout: false,
            onkeyup: false,
            rules: {
                "BorrowID": {
                    required: true,
                    maxlength: 10
                },
                "StudentID": {
                    required: true,
                    maxlength: 10
                },
                "BookID": {
                    required: true,
                    min: 1
                },
                "Quantity": {
                    required: true,
                    min: 1
                }
            },
            messages: {
                "BorrowID": {
                    required: "Bắt buộc nhập BorrowID",
                    maxlength: "Hãy nhập tối đa 10 ký tự"
                },
                "StudentID": {
                    required: "Bắt buộc nhập StudentID",
                    maxlength: "Hãy nhập tối đa 10 ký tự"
                },
                "BookID": {
                    required: "Bắt buộc nhập BookID",
                    maxlength: "Hãy nhập tối đa 10 ký tự"
                },
                "Quantity": {
                    required: "Bắt buộc nhập Quantity",
                    min: "Hãy nhập ít nhất 1 ký tự"
                }
            }
        });
    });

