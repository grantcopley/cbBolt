component extends="tests.resources.ModuleIntegrationSpec" appMapping="/app" {

    include template="../../helpers/cbLivewire.cfm";

    function run() {
        describe( "helpers/cbLivewire.cfm", function() {
            describe( "livewireStyles() method", function() {
                it( "returns the livewire styles", function() {
                    var result = livewireStyles();
                    expect( result ).toInclude( "<!-- Livewire Styles -->" );
                    expect( result ).toInclude(
                        "[wire\:loading], [wire\:loading\.delay]"
                    );
                    expect( result ).toInclude( "<style>" );
                    expect( result ).toInclude( "</style>" );
                } );
            } );

            describe( "livewireScrpts() method", function() {
                it( "returns the livewire scripts", function() {
                    var result = livewireScripts();
                    expect( result ).toInclude( "<!-- Livewire Scripts -->" );
                    expect( result ).toInclude( "window.livewire = new Livewire();" );
                } );
            } );
        } );
    }

}
