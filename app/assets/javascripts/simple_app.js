//begin main function
$(document).ready(function(){
    data_form.checkInitialFormState();
    data_form.checkForFormProgress();
    data_form.blockEnterKeyOnForm();
});
//end main function

    var data_form = data_form || {};

    var data_form = {
        checkInitialFormState: function(){
            $(".do_something").each(function(){
                var data_value = $(this).find("input").val();
                if (data_value === "" || data_value === null || data_value === undefined){
                    $(this).addClass("has-warning");
                } else{
                    $(this).addClass("has-success");
                }
            });
        },

        checkForFormProgress: function(){
            $(":input").change(function(){
                console.log($(this));
                $(this).closest(".do_something").removeClass("has-warning");
                $(this).closest(".do_something").addClass("has-success");
            });
        },

        blockEnterKeyOnForm: function(){
            $(document).on("keyup keypress", "form input[type='text']", function(e){
                if(e.which == 13) {
                    e.preventDefault();
                    return false;
                }
            });

            $(document).on("keyup keypress", "form select", function(e){
                if(e.which == 13) {
                    e.preventDefault();
                    return false;
                }
            });
        }
    };
