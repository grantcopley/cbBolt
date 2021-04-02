component {

    this.name = "cbLivewire";
    this.version = "1.0.0";
    this.author = "Grant Copley";
    this.webUrl = "https://github.com/grantcopley/cbLivewire";
    this.dependencies = [];
    this.entryPoint = "/livewire";
    this.layoutParentLookup = false;
    this.viewParentLookup = false;

    function configure() {
        settings = {
            "register": {
                "interceptor": true,
                "helper": true,
                "controllerMethods": true
            },
            "defaultViewArgs": { "view": "main/index", "module": "cbLivewire" },
            "version": function() {
                return "";
            }
        };
        routes = [ { pattern: "/", handler: "Welcome", action: "index" } ];
    }

    function onLoad() {
        if ( settings.register.interceptor ) {
            controller
                .getInterceptorService()
                .registerInterceptor(
                    interceptorName = "LivewireLifecycleInterceptor",
                    interceptorClass = "#moduleMapping#.interceptors.cbLivewireLifecycle"
                );
        }

        if ( settings.register.helper ) {
            var helpers = controller.getSetting( "applicationHelper" );
            arrayAppend( helpers, "#moduleMapping#/helpers/cbLivewire.cfm" );
            controller.setSetting( "applicationHelper", helpers );
        }

        if ( settings.register.controllerMethods ) {
            if (
                controller.getSetting(
                    name = "controllerDecorator",
                    defaultValue = ""
                ) != ""
            ) {
                throw(
                    "Cannot auto-register the `cbLivewireControllerDecorator` when a `controllerDecorator` is already set."
                );
            }
            controller.setSetting(
                "controllerDecorator",
                "#moduleMapping#.models.cbLivewireControllerDecorator"
            );
            controller.getLoaderService().createControllerDecorator();
        }
    }

    function onUnload() {
        if ( settings.register.helper ) {
            controller.setSetting(
                "applicationHelper",
                arrayFilter( controller.getSetting( "applicationHelper" ), function( helper ) {
                    return helper != "#moduleMapping#/helpers/cbLivewire.cfm";
                } )
            );
        }

        if ( settings.register.interceptor ) {
            controller
                .getInterceptorService()
                .unregister(
                    interceptorName = "cbLivewireLifecycleInterceptor"
                );
        }

        if ( settings.register.controllerMethods ) {
            controller.setSetting( "controllerDecorator", "" );
        }
    }

}
