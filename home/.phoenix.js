var getActiveApp = function() {
  var win = Window.focusedWindow()
  if (win === undefined) {
    return undefined
  }
  return Window.focusedWindow().app()
}

var activateAppByName = function(name) {
  // api.alert('Activate: ' + name + '!')
  var active = getActiveApp()
  if (active === undefined) {
    api.launch(name)
    return
  }
  api.launch(name)
}

var showOrHideAppByName = function(name) {
  var active = getActiveApp()
  if (active === undefined) {
    api.launch(name)
    return
  }
  if (active.title() === name) {
    active.hide()
  } else {
    api.launch(name)
  }
}

function activateOrHideApp(name) {
  return function() {
    showOrHideAppByName(name)
  }
}

function activateApp(name) {
  return function () {
    activateAppByName(name)
  }
}

function focusLeft() {
    Window.focusedWindow().focusWindowLeft()
}

function focusRight() {
    Window.focusedWindow().focusWindowRight()
}

//api.bind('e', ['ctrl'], activateApp('Atom'))
api.bind('p', ['ctrl', 'shift'], activateOrHideApp('iTerm'))
api.bind('i', ['ctrl', 'shift'], activateApp('Atom'))
api.bind('o', ['ctrl', 'shift'], activateApp('Google Chrome'))
// api.bind('f', ['ctrl'], activateApp('Finder'))
//api.bind('z', ['ctrl'], focusLeft)
//api.bind('x', ['ctrl'], focusRight)
