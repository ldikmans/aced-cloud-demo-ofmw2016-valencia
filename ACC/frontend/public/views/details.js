define(['knockout', 'ojs/ojcore', 'settings', 'ojs/ojmodel', 'ojs/ojfilmstrip', 'ojs/ojbutton'],
    function (ko, oj, settings) {
        var ActModel = oj.Model.extend({
            urlRoot: settings.baseUrl + '/mobile/custom/artistapi/acts'
        });
        return DetailsViewModel;

        function DetailsViewModel(moduleParams) {
            this.id = moduleParams.drillModel.drillId();
            this.fetched = ko.observable(false);
            this.data = ko.observableArray();
            this.handleActivated = handleActivated.bind(this);
            this.getItemInitialDisplay = getItemInitialDisplay.bind(this);
            this.goBack = goBack.bind(this, moduleParams);
        }
        
        function handleActivated() {
            var self = this;
            var act = new ActModel();
            act.id = this.id;
            act.fetch({
                success: function (model, response, options) {
                    self.data(oj.KnockoutUtils.map(model))
                    self.fetched(true);
                }
            });
        }
        
        function getItemInitialDisplay(index) {
            console.log('@@@@@@@@@ index', index);
            return index < 3 ? '' : 'none';
        }
        
        function goBack(moduleParams, event, ui) {
            moduleParams.drillModel.drillId(undefined);
            moduleParams.drillModel.currentModule('acts');
        }
        
    });
