<cfscript>

    /**
    * Returns the styles to be placed in HTML head
    */
    function livewireStyles() {
        return getInstance( "cblivewire.handlers.Livewire" ).getStyles();
    }

    /**
    * Returns the JS to be placed in HTML body
    */
    function livewireScripts() {
        return getInstance( "cblivewire.handlers.Livewire" ).getScripts();
    }

    /**
    * Renders a livewire component
    */
    function livewire( componentName ) {
        return getInstance( "cblivewire.handlers.Livewire" ).render( variables.event, componentName );
    }


</cfscript>