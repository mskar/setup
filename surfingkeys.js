iunmap("<Ctrl-f>");
aceVimMap('<C-u>', '<Esc>d0xi', 'insert');
Hints.style('font-size: 13pt;')


imapkey('<Alt-b>', 'Move backward one word', function() {
    var element = getRealEdit();
    if (element.setSelectionRange !== undefined) {
        var pos = nextNonWord(element.value, -1, element.selectionStart);
        element.setSelectionRange(pos, pos);
    } else {
        // for contenteditable div
        document.getSelection().modify("move", "backward", "word");
        }
    }
);


imapkey('<Alt-d>', 'Delete a word forwards', function() {
    var element = getRealEdit();
    if (element.setSelectionRange !== undefined) {
        var pos = deleteNextWord(element.value, 1, element.selectionStart);
        element.value = pos[0];
        element.setSelectionRange(pos[1], pos[1]);
    } else {
        // for contenteditable div
        var selection = document.getSelection();
        var p0 = selection.focusOffset;
        document.getSelection().modify("move", "forward", "word");
        var v = selection.focusNode.data, p1 = selection.focusOffset;
        selection.focusNode.data = v.substr(0, p0) + v.substr(p1);
        selection.setPosition(selection.focusNode, p0);
        }
    }
);

imapkey('<Alt-f>', 'Move forward one word', function() {
    var element = getRealEdit();
    if (element.setSelectionRange !== undefined) {
        var pos = nextNonWord(element.value, 1, element.selectionStart);
        element.setSelectionRange(pos, pos);
    } else {
        // for contenteditable div
        document.getSelection().modify("move", "forward", "word");
        }
    }
);

imapkey('<Ctrl-a>', 'Move to the beginning of the line', function() {
    var element = getRealEdit();
    if (element.setSelectionRange !== undefined) {
        element.setSelectionRange(0, 0);
    } else {
        // for contenteditable div
        var selection = document.getSelection();
        selection.setPosition(selection.focusNode, 0);
        // blink cursor to bring cursor into view
        Visual.showCursor();
        Visual.hideCursor();
        }
    }
);

imapkey('<Ctrl-e>', 'Move to the end of the line', function() {
var element = getRealEdit();
    if (element.setSelectionRange !== undefined) {
        try {
            element.setSelectionRange(element.value.length, element.value.length);
        } catch(err) {
            if (err instanceof DOMException && err.name === "InvalidStateError") {
                // setSelectionRange does not apply
            } else {
                throw err;
            }
        }
    } else if (isEditable(element)) {
        // for contenteditable div
        if (element.childNodes.length > 0) {
            var node = element.childNodes[element.childNodes.length -1];
            if (node.nodeType === Node.TEXT_NODE) {
                document.getSelection().setPosition(node, node.data.length);
            } else {
                document.getSelection().setPosition(node, node.childNodes.length);
            }
            // blink cursor to bring cursor into view
            Visual.showCursor();
            Visual.hideCursor();
            }
        }
    }
);

imapkey('<Ctrl-u>', 'Delete to the beginning of the line', function() {
    var element = getRealEdit();
    if (element.setSelectionRange !== undefined) {
        element.value = element.value.substr(element.selectionStart);
        element.setSelectionRange(0, 0);
    } else {
        // for contenteditable div
        var selection = document.getSelection();
        selection.focusNode.data = selection.focusNode.data.substr(selection.focusOffset);
        }
    }
);

imapkey('<Ctrl-w>', 'Delete a word backwards', function() {
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
    }
);

// The shorcuts below don't work all that great
// Let macOS handle Alt-b and Alt-f
// Surfingkeys inserts strange characters:
// Alt-b: ☢
// Alt-d: ♂
// Alt-f: ♢
iunmap("<Alt-b>");
iunmap("<Alt-d>");
iunmap("<Alt-f>");
// Let macOS handle Ctrl-w
// Surfingkeys requires two presses to delete once in Chrome, but not Firefox
iunmap("<Ctrl-w>");
