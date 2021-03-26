  component {

    this.name = "cbbolt";
    this.version = "1.0.0";
    this.author = "Grant Copley";
    this.webUrl = "https://github.com/grantcopley/cbbolt";
    this.dependencies = [];

    function configure() {
        settings = {
            "registerInterceptor": true,
            "registerHelper": true,
            "regsiterControllerMethods": true,
            "defaultViewArgs": { "view": "main/index", "module": "cbbolt" },
            "version": function() {
                return "";
            }
        };
    }

    function onLoad() {
        if ( settings.registerInterceptor ) {
            controller
                .getInterceptorService()
                .registerInterceptor(
                    interceptorName = "BoltLifecycleInterceptor",
                    interceptorClass = "#moduleMapping#.interceptors.BoltLifecycle"
                );
        }

        if ( settings.registerHelper ) {
            var helpers = controller.getSetting( "applicationHelper" );
            arrayAppend( helpers, "#moduleMapping#/helpers/Bolt.cfm" );
            controller.setSetting( "applicationHelper", helpers );
        }

        if ( settings.regsiterControllerMethods ) {
            if (
                controller.getSetting(
                    name = "controllerDecorator",
                    defaultValue = ""
                ) != ""
            ) {
                throw(
                    "Cannot auto-register the `BoltControllerDecorator` when a `controllerDecorator` is already set."
                );
            }
            controller.setSetting(
                "controllerDecorator",
                "#moduleMapping#.models.BoltControllerDecorator"
            );
            controller.getLoaderService().createControllerDecorator();
        }
    }

    function onUnload() {
        if ( settings.registerHelper ) {
            controller.setSetting(
                "applicationHelper",
                arrayFilter( controller.getSetting( "applicationHelper" ), function( helper ) {
                    return helper != "#moduleMapping#/helpers/Bolt.cfm";
                } )
            );
        }

        if ( settings.registerInterceptor ) {
            controller
                .getInterceptorService()
                .unregister( interceptorName = "BoltLifecycleInterceptor" );
        }

        if ( settings.regsiterControllerMethods ) {
            controller.setSetting( "controllerDecorator", "" );
        }
    }

}
