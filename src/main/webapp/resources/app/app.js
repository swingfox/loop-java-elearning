/// <reference path="../typings/jquery/jquery.d.ts" />
/// <reference path="../typings/jqueryui/jqueryui.d.ts" />
/// <reference path="../typings/angularjs/angular.d.ts" />
/// <reference path="model.ts" />
/// <reference path="service.ts" />
$(document).ready(initializeDragonLOIDE);
var DNDMechanism = (function () {
    function DNDMechanism() {
    }
    DNDMechanism.prototype.dragStart = function (evnt) {
        this.elementID = evnt.target.id;
    };
    DNDMechanism.prototype.drop = function (evnt) {
        var element = jQuery(document.getElementById(this.elementID));
        var letype = element.find('.type').html();
        var id = this.elementID;
        //jQuery(evnt.target).append('<img class="le-object" src="' + jQuery('#htmllauncher').val()  + '/resources/upload.gif"/>');
        if (letype == 'quiz' || letype == 'class') {
            jQuery.ajax({
                type: 'POST',
                url: '/loop-XYZ/loop/api/file/prepare/' + this.elementID,
                success: function (data, status, jqXHR) {
                    jQuery(evnt.target).append('<iframe class="le-object html-le" src="' + jQuery('#htmllauncher').val() + '/html-le-stage/' + id + '/index.html"></iframe>');
                },
                error: function () {
                    jQuery(evnt.target).append('<h1> No Preview </h1>');
                }
            });
        }
        else {
            switch (letype) {
                case "audio":
                    jQuery(evnt.target).append('<input class="le-id" type="hidden" value="' + this.elementID + '"><audio class="le-object" src=/loop-XYZ/loop/api/file/retrieve/' + this.elementID + ' controls />');
                    break;
                case "video":
                    jQuery(evnt.target).append('<input class="le-id" type="hidden" value="' + this.elementID + '"><video class="le-object" src=/loop-XYZ/loop/api/file/retrieve/' + this.elementID + ' controls />');
                    break;
                case "text":
                    this.getTextData(this.elementID, evnt.target);
                    break;
                case "image":
                    jQuery(evnt.target).append('<input class="le-id" type="hidden" value="' + this.elementID + '"><img class="le-object" src=/loop-XYZ/loop/api/file/retrieve/' + this.elementID + ' />');
                    break;
                case "quiz":
                    {
                        jQuery(evnt.target).append(jQuery('<iframe class="le-object html-le" src="#htmllauncher').val() + '/html-le-stage/' + this.elementID + '/index.html"></iframe>');
                        break;
                    }
            }
        }
        jQuery(evnt.target).children('.le-obj-del').removeAttr('disabled');
        jQuery(evnt.target).removeClass('slot');
        jQuery(evnt.target).parent().append('<div class="well slot"><button type="button" class="le-obj-del" disabled="true">X</button></div>');
    };
    DNDMechanism.prototype.getTextData = function (id, target) {
        jQuery.get('/loop-XYZ/loop/api/file/retrieve/' + id, function (data, msg, jqXHR) {
            jQuery(target).append('<input class="le-id" type="hidden" value="' + id + '"><p class="le-object" >' + data + '</p>');
        });
    };
    return DNDMechanism;
})();
function initializeDragonLOIDE() {
    jQuery('#pages').tabs();
    jQuery('#pageAddBtn').on('click', function (evnt) {
        evnt.preventDefault();
        var page = (jQuery('#pages >ul >li').length + 1);
        jQuery('#pages ul').append('<li><a href="#page-' + page + '">' + page + '</a><span class="ui-icon ui-icon-circle-close ui-closable-tab"></span></li>');
        jQuery('#pages').append('<div class="page" id= "page-' + page + '" > \
				<div class="well slot" ><button type="button" class="le-obj-del" disabled= "true" > X </button></div ></div>');
        jQuery('#pages').tabs('refresh');
        jQuery('.page').sortable();
    });
    $("body").on("click", ".ui-closable-tab", function () {
        var title = jQuery(this).parent();
        var pane = jQuery(title.children('a').attr('href'));
        title.remove();
        pane.remove();
        $("#pages").tabs("refresh");
        var page = jQuery('#pages >ul >li').length;
        var titles = jQuery('#pages >ul >li');
        for (var i = 0; i < page; ++i) {
            var prev = jQuery(titles[i]).children('a').attr("href");
            jQuery(titles[i]).children('a').html((i + 1).toString()).attr("href", "#page-" + (i + 1));
            jQuery(prev).attr('id', "page-" + (i + 1));
        }
        $("#pages").tabs("refresh");
    });
    jQuery('.page').sortable();
    jQuery('body').on('click', '.le-obj-del', function (evnt) {
        jQuery(evnt.target).parent().detach();
    });
    var DNDHandler = new DNDMechanism();
    jQuery('body').on('dragover', '.slot', function (evnt) {
        evnt.preventDefault();
    });
    jQuery('body').on('dragstart', '.le', DNDHandler.dragStart.bind(DNDHandler));
    jQuery('body').on('drop', '.slot', DNDHandler.drop.bind(DNDHandler));
    jQuery('#searchForm').on('submit', function (evnt) {
        evnt.preventDefault();
        jQuery.get('/loop-XYZ/loop/api/le/query/' + jQuery('#searchBox').val(), function (data, status, jqXHR) {
            var results = data;
            jQuery('#resultList').empty();
            results.forEach(function (element, index) {
                jQuery('#resultList').append(toElement(element));
            });
        });
    });
    jQuery('#leForm').on('submit', function (evnt) {
        evnt.preventDefault();
        var inputs = jQuery('#leForm').find('.required');
        var complete = true;
        for (var i = 0; i < inputs.length; ++i) {
            if (jQuery(inputs[i]).val() == '') {
                complete = false;
                break;
            }
        }
        if (complete) {
            var data = new FormData(evnt.target);
            jQuery.ajax({
                type: 'POST',
                url: '/loop-XYZ/loop/api/file/upload',
                processData: false,
                contentType: false,
                data: data,
                success: function (data, status, jqXHR) {
                    //alert('Upload Complete!');
                    jQuery('#leuCloser').click();
                    alert("Learing Element Uploaded.");
                },
                error: function (data, status, jqXHR) {
                    //alert('Upload Complete!');
                    //jQuery('#leuCloser').click();
                    alert("Learing Element Upload Failed");
                }
            });
        }
        else {
            alert('please complete entire form');
        }
    });
    jQuery('#quizForm').on('submit', function (evnt) {
        evnt.preventDefault();
        var inputs = jQuery('#leForm').find('.required');
        var complete = true;
        for (var i = 0; i < inputs.length; ++i) {
            if (jQuery(inputs[i]).val() == '') {
                complete = false;
                break;
            }
        }
        if (complete) {
            var data = new FormData(evnt.target);
            jQuery.ajax({
                type: 'POST',
                url: '/loop-XYZ/loop/api/file/upload',
                processData: false,
                contentType: false,
                data: data,
                success: function (data, status, jqXHR) {
                    //alert('Upload Complete!');
                    jQuery('#leuCloser').click();
                    alert("Learing Element Uploaded.");
                },
                error: function (data, status, jqXHR) {
                    //alert('Upload Complete!');
                    //jQuery('#leuCloser').click();
                    alert("Learing Element Upload Failed");
                }
            });
        }
        else {
            alert('please complete entire form');
        }
    });
    jQuery('#loForm').on('submit', function (evnt) {
        evnt.preventDefault();
        var inputs = jQuery('#loForm').find('.required');
        var complete = true;
        for (var i = 0; i < inputs.length; ++i) {
            if (jQuery(inputs[i]).val() == '') {
                complete = false;
                break;
            }
        }
        if (complete) {
            var data = new FormData(evnt.target);
            var lo = jQuery('.page');
            var compiled = [];
            for (var i = 0; i < lo.length; ++i) {
                var elements = jQuery(lo[i]).find('.le-id');
                var elems1 = [];
                for (var j = 0; j < elements.length; ++j) {
                    //alert(jQuery(elements[j]).val());
                    elems1.push(jQuery(elements[j]).val());
                }
                //alert(JSON.stringify(elems1));
                if (elems1.length != 0)
                    compiled.push(elems1);
            }
            //alert(JSON.stringify(compiled));
            data.append("elements", JSON.stringify(compiled));
            jQuery.ajax({
                type: 'POST',
                url: '/loop-XYZ/loop/api/file/upload/lo',
                processData: false,
                contentType: false,
                data: data,
                success: function (data, status, jqXHR) {
                    jQuery('#louCloser').click();
                    alert("Learing Element Uploaded.");
                },
                error: function () {
                    alert("Learing Object Upload Failed");
                }
            });
        }
        else {
            alert('Please fill all forms');
        }
    });
}
function toElement(data) {
    var elem;
    elem = '<li id="' + data.id + '" class="le" draggable= "true" > <div class="list-group-item" >';
    elem = elem + '<span class="badge type" >' + data.type + '</span>';
    elem = elem + '<span class="badge" >' + data.size + '</span>';
    elem = elem + '<h4>' + data.title + '<br />';
    elem = elem + '<small>' + data.authorName + '</small> <br />';
    elem = elem + '<small>' + data.publishingDate + '</small></h4></div></li>';
    /*< li id= "10dhna0e19k2m9h41j14h" class="le" draggable= "true" >
    <div class="list-group-item" >
    <span class="badge" id= "type" > audio < /span>
    < span class="badge" > 0.5 MB< /span>
    < h4 >
    Blue whale song
    < br /><small>J - dar Siegfred A.Rodriguez < /small>
    < br /><small>07 / 14 / 2012 < /small>
    < /h4>
    < /div>
    < /li>*/
    return elem;
}
