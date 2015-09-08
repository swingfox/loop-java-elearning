jquery.inputfile.js
==================

Small jquery library used to replace the input type file elements with some regular elements so you can change its style.

```javascript
$('input[type="file"]').inputfile({
    uploadText: '<span class="glyphicon glyphicon-upload"></span> Select a file',
    removeText: '<span class="glyphicon glyphicon-trash"></span>',
    restoreText: '<span class="glyphicon glyphicon-remove"></span>',
      
    uploadButtonClass: 'btn btn-primary',
    removeButtonClass: 'btn btn-default',
    
    removeName: '',
    removeValue: 1,
        
    dontRemove: false
});
```

The complete list of parameters:

Key |  Description
--- | ---
uploadText | Content for the upload button 
removeText | Content for the remove button
restoreText | Content for the restore button
uploadButtonClass | Css class for the upload button
removeButtonClass | Css class for the remove/restore button
removeName | Input name to use when the file is deleted, the same than the input file if none is especified
removeValue | Value to send when the file is removed, 1 by default
dontRemove | If true the remove functionality will be disabled

This will replace the file input with a regular button and when you choose a file will show the url for the file and a remove button that let you cancel file selection.

If you want to laod a previously updated file you can set two attributes, a data-value with the url of the file and a data-text with the name of the file:

```html
<input type="file" data-value="/res/uploads/file.txt" data-text="file.txt" />
```

If you do that when you click the remove button it will get replaced with a restore button that cancell the remove action.
When a file is removed a checkbox is created internally that gets the name from removeName property and the value from removeValue.
At the same time the original input file is disabled yo when you submit the input you are actually submiting the checkbox.

