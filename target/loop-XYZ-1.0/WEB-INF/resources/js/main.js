$(document).ready(function(){
    $('.btn-profile-edit').click(function(e){
        var group = $('form.form-profile');
        $('input[type="text"], input[type="email"]', group).removeClass('hide');
        $('input[name="first_name"]', group).focus();
        $('span', group).addClass('hide');
        $(this).addClass('hide');
        $('button.btn-profile-edit-save').removeClass('hide');
        $('button.btn-profile-edit-cancel').removeClass('hide');
        e.preventDefault();
    });
    $('.btn-profile-edit-cancel').click(function(e){
        var group = $('form.form-profile');
        $('input', group).each(function(){
            var val = $(this).attr('data-name');
            
            $(this).val(val);
        });
        $('input[type="text"], input[type="email"]', group).addClass('hide');
        $('span', group).removeClass('hide');
        $(this).addClass('hide');
        $('button.btn-profile-edit').removeClass('hide');
        $('button.btn-profile-edit-save').addClass('hide');
        $(this).addClass('hide');
        e.preventDefault();
    });
    $('.btn-profile-edit-save').click(function(e){
        $('form.form-profile').submit();
        
        e.preventDefault();
    });
    $('#profile-picture').on({
        mouseenter: function(){
            $('button', this).show();
        },
        mouseleave: function(){
            $('button', this).hide();
        }
    });
    $('#profile-picture button').click(function(e){
        $('input[type="file"]').click();
        
        e.preventDefault();
    });
    $('input[type="file"]').change(function(){
        $(this).parent('form').submit();
    });
    $('.btn-delete-entry').click(function(){
        $('#responsive_confirmDelete #btn-delete-entry').attr('data-value',$(this).parent('li').attr('data-value'));
        $('#responsive_confirmDelete').modal({
            backdrop: 'static'
        });
        $('#responsive_confirmDelete').on('shown.bs.modal',function(){
            $('#responsive_confirmDelete #btn-delete-entry').focus();
        });
    });
    $('#responsive_confirmDelete #btn-delete-entry').click(function(){
        var value = $(this).attr('data-value');
        
        $('#responsive_confirmDelete').modal('hide');
        $('#responsive_confirmDelete').on('hidden.bs.modal', function(){
            $.post('http://localhost/jiary/index.php/journal/delete_entry', { entry_id: value }, function(data){
                if(data.status){
                    var value = data.status;
                    $('ul.jiary-list-view li[data-value="' + value + '"]').slideUp('fast',function(){
                        $(this).remove();
                        if(!$('ul.jiary-list-view').has('li').length){
                            $('ul.jiary-list-view').append('<li style="text-align: center; border: 1px solid black; padding: 10px 5px">\n\
                                    No Entries Created\n\
                                    </li>').hide().slideDown('fast');
                        }
                    });
                }
            }, 'json');
        });
    });
    /* create entry */
    $('#form-create-entry').submit(function(e){
        var form = $('#form-create-entry');
        var html = $('#summernote').code();
        
        $('textarea#summernote_container', form).val(html);
    });

    /* collapse entry */
    $('.btn-content-collapse').click(function(){
        var hint = $(this).attr('data-hint');
        var group = $(this).parent('li');

        if(hint == 0){
            $('p.list', group).stop(true,true).slideDown('fast');
            $('i',this).removeClass('icon-plus').addClass('icon-minus');
            $('span',this).html('Hide');
            $(this).attr('data-hint','1');
        }
        else{
            $('p.list', group).stop(true,true).slideUp('fast');
            $('i',this).removeClass('icon-minus').addClass('icon-plus');
            $('span',this).html('Show more');
            $(this).attr('data-hint','0');
        }
    });
});
