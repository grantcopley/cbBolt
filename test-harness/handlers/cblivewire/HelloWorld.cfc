component extends="cblivewire.handlers.Component" accessors="true" {

    property name="message" default="Hello World123";

    function render() {
        return renderView( "cblivewire/helloworld" );
    }
}