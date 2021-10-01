iunmap("<Ctrl-e>");
iunmap("<Ctrl-f>");
imap("<Alt-f>", "S-Right");
aceVimMap('<C-u>', '<Esc>d0xi', 'insert');
Hints.style('font-size: 13pt;')


imapkey('<Ctrl-w>', '#15Delete a word backwards', function() {
    var element = getRealEdit();
    if (element.setSelectionRange !== undefined) {
        var pos = deleteNextWord(element.value, -1, element.selectionStart);
        element.value = pos[0];
        element.setSelectionRange(pos[1], pos[1]);
    } else {
        // for contenteditable div
        var selection = document.getSelection();
        var p0 = selection.focusOffset;
        document.getSelection().modify("move", "backward", "word");
        var v = selection.focusNode.data, p1 = selection.focusOffset;
        selection.focusNode.data = v.substr(0, p1) + v.substr(p0);
        selection.setPosition(selection.focusNode, p1);
    }
});
