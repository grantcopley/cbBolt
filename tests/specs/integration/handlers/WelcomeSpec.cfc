component extends="tests.resources.ModuleIntegrationSpec" appMapping="/app" {

    function run() {
        describe( "Welcome Handler", function() {
            it( "has a welcome page that renders the expected output", function() {
                var event = this.get( "cbLivewire:welcome.index" );
				expect( event.getRenderedContent() ).toInclude( "Welcome to cbLivewire" );
            } );
        } );
    }

}
