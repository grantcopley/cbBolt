<cfscript>

    /**
    * Returns the styles to be placed in HTML head
    */
    function livewireStyles() {
        return fileRead( "livewireStyles.cfm" ).trim();
    }

    /**
    * Returns the JS to be placed in HTML body
    */
    function livewireScripts() {
        return fileRead( "livewireScripts.cfm" ).trim();
    }

</cfscript>