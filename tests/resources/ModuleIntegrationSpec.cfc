component extends="coldbox.system.testing.BaseTestCase" {

    function beforeAll() {
        super.beforeAll();

        getController()
            .getModuleService()
            .registerAndActivateModule( "cbLivewire", "testingModuleRoot" );
    }

    /**
     * @beforeEach
     */
    function setupIntegrationTest() {
        setup();
    }

}
