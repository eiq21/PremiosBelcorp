const myTab = new Tabby.Component(document.querySelector('.tabs'), {
    onConstruct: function(component) {
      console.log(component)
    },
    // More hooks
    // ...
  });