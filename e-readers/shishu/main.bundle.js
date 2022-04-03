webpackJsonp([1,4],{

/***/ 186:
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_0__angular_core__ = __webpack_require__(1);
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_1__ng_bootstrap_ng_bootstrap__ = __webpack_require__(160);
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "a", function() { return SlokaDetailView; });
var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
var __metadata = (this && this.__metadata) || function (k, v) {
    if (typeof Reflect === "object" && typeof Reflect.metadata === "function") return Reflect.metadata(k, v);
};


var SlokaDetailView = (function () {
    function SlokaDetailView(modalService) {
        this.modalService = modalService;
    }
    SlokaDetailView.prototype.ngOnInit = function () {
        this.showList = ["row1", "row6", "row7", "row8"];
        this.checkDefaultRows();
    };
    SlokaDetailView.prototype.checkDefaultRows = function () {
        this.row1 = true;
        this.row6 = true;
        this.row7 = true;
        this.row8 = true;
    };
    SlokaDetailView.prototype.show = function (name) {
        if (this.showList != undefined) {
            return this.showList.indexOf(name) > -1 ? false : true;
        }
        else {
            return false;
        }
    };
    SlokaDetailView.prototype.showRow = function (value, name) {
        var pos = this.showList.indexOf(name);
        if (pos < 0) {
            this.showList.push(name);
        }
        else {
            this.showList.splice(pos, 1);
        }
    };
    SlokaDetailView.prototype.mouseEnter = function (imagePath, content) {
        this.options = {};
        this.options.size = "lg";
        this.showImagePath = imagePath;
        this.modalService.open(content, this.options);
    };
    return SlokaDetailView;
}());
__decorate([
    __webpack_require__.i(__WEBPACK_IMPORTED_MODULE_0__angular_core__["Input"])(),
    __metadata("design:type", Array)
], SlokaDetailView.prototype, "slokaTranslation", void 0);
__decorate([
    __webpack_require__.i(__WEBPACK_IMPORTED_MODULE_0__angular_core__["Input"])(),
    __metadata("design:type", String)
], SlokaDetailView.prototype, "title", void 0);
__decorate([
    __webpack_require__.i(__WEBPACK_IMPORTED_MODULE_0__angular_core__["Input"])(),
    __metadata("design:type", Object)
], SlokaDetailView.prototype, "vrittam", void 0);
__decorate([
    __webpack_require__.i(__WEBPACK_IMPORTED_MODULE_0__angular_core__["Input"])(),
    __metadata("design:type", Object)
], SlokaDetailView.prototype, "alankara", void 0);
SlokaDetailView = __decorate([
    __webpack_require__.i(__WEBPACK_IMPORTED_MODULE_0__angular_core__["Component"])({
        selector: 'sloka-detail-view',
        template: __webpack_require__(485),
        styles: [__webpack_require__(472)]
    }),
    __metadata("design:paramtypes", [typeof (_a = typeof __WEBPACK_IMPORTED_MODULE_1__ng_bootstrap_ng_bootstrap__["b" /* NgbModal */] !== "undefined" && __WEBPACK_IMPORTED_MODULE_1__ng_bootstrap_ng_bootstrap__["b" /* NgbModal */]) === "function" && _a || Object])
], SlokaDetailView);

var _a;
//# sourceMappingURL=E:/Anupama/new-interface/sisupal/src/sloka-detail-child.component.js.map

/***/ }),

/***/ 187:
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_0__angular_core__ = __webpack_require__(1);
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_1__angular_http__ = __webpack_require__(72);
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_2_rxjs_Observable__ = __webpack_require__(0);
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_2_rxjs_Observable___default = __webpack_require__.n(__WEBPACK_IMPORTED_MODULE_2_rxjs_Observable__);
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_3_rxjs_add_operator_catch__ = __webpack_require__(86);
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_3_rxjs_add_operator_catch___default = __webpack_require__.n(__WEBPACK_IMPORTED_MODULE_3_rxjs_add_operator_catch__);
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_4_rxjs_add_operator_map__ = __webpack_require__(87);
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_4_rxjs_add_operator_map___default = __webpack_require__.n(__WEBPACK_IMPORTED_MODULE_4_rxjs_add_operator_map__);
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "a", function() { return SummaryService; });
var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
var __metadata = (this && this.__metadata) || function (k, v) {
    if (typeof Reflect === "object" && typeof Reflect.metadata === "function") return Reflect.metadata(k, v);
};





var SummaryService = (function () {
    function SummaryService(http) {
        this.http = http;
        this.summaryUrl = 'assets/json/summary.json';
    }
    SummaryService.prototype.getSummaryList = function () {
        return this.http.get(this.summaryUrl)
            .map(this.extractData)
            .catch(this.handleError);
    };
    /* getSummary() :Promise<Summary[]>{
       
       return this.http.get(this.summaryUrl)
                     .toPromise()
                     .then(this.extractData)
                     .catch(this.handleError);
     
     
     }*/
    SummaryService.prototype.extractData = function (res) {
        var body = res.json();
        return body || {};
    };
    SummaryService.prototype.handleError = function (error) {
        return __WEBPACK_IMPORTED_MODULE_2_rxjs_Observable__["Observable"].throw("error");
    };
    return SummaryService;
}());
SummaryService = __decorate([
    __webpack_require__.i(__WEBPACK_IMPORTED_MODULE_0__angular_core__["Injectable"])(),
    __metadata("design:paramtypes", [typeof (_a = typeof __WEBPACK_IMPORTED_MODULE_1__angular_http__["c" /* Http */] !== "undefined" && __WEBPACK_IMPORTED_MODULE_1__angular_http__["c" /* Http */]) === "function" && _a || Object])
], SummaryService);

var _a;
//# sourceMappingURL=E:/Anupama/new-interface/sisupal/src/summary.service.js.map

/***/ }),

/***/ 280:
/***/ (function(module, exports) {

function webpackEmptyContext(req) {
	throw new Error("Cannot find module '" + req + "'.");
}
webpackEmptyContext.keys = function() { return []; };
webpackEmptyContext.resolve = webpackEmptyContext;
module.exports = webpackEmptyContext;
webpackEmptyContext.id = 280;


/***/ }),

/***/ 281:
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
Object.defineProperty(__webpack_exports__, "__esModule", { value: true });
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_0__angular_platform_browser_dynamic__ = __webpack_require__(287);
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_1__angular_core__ = __webpack_require__(1);
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_2__environments_environment__ = __webpack_require__(304);
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_3__app_app_module__ = __webpack_require__(294);




if (__WEBPACK_IMPORTED_MODULE_2__environments_environment__["a" /* environment */].production) {
    __webpack_require__.i(__WEBPACK_IMPORTED_MODULE_1__angular_core__["enableProdMode"])();
}
__webpack_require__.i(__WEBPACK_IMPORTED_MODULE_0__angular_platform_browser_dynamic__["a" /* platformBrowserDynamic */])().bootstrapModule(__WEBPACK_IMPORTED_MODULE_3__app_app_module__["a" /* AppModule */]);
//# sourceMappingURL=E:/Anupama/new-interface/sisupal/src/main.js.map

/***/ }),

/***/ 291:
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_0__angular_core__ = __webpack_require__(1);
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "a", function() { return AboutComponentComponent; });
var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
var __metadata = (this && this.__metadata) || function (k, v) {
    if (typeof Reflect === "object" && typeof Reflect.metadata === "function") return Reflect.metadata(k, v);
};

var AboutComponentComponent = (function () {
    function AboutComponentComponent() {
    }
    AboutComponentComponent.prototype.ngOnInit = function () {
    };
    return AboutComponentComponent;
}());
AboutComponentComponent = __decorate([
    __webpack_require__.i(__WEBPACK_IMPORTED_MODULE_0__angular_core__["Component"])({
        selector: 'app-about-component',
        template: __webpack_require__(477),
        styles: [__webpack_require__(464)]
    }),
    __metadata("design:paramtypes", [])
], AboutComponentComponent);

//# sourceMappingURL=E:/Anupama/new-interface/sisupal/src/about-component.component.js.map

/***/ }),

/***/ 292:
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_0__angular_core__ = __webpack_require__(1);
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "a", function() { return AboutComponent; });
var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
var __metadata = (this && this.__metadata) || function (k, v) {
    if (typeof Reflect === "object" && typeof Reflect.metadata === "function") return Reflect.metadata(k, v);
};

var AboutComponent = (function () {
    function AboutComponent() {
    }
    AboutComponent.prototype.ngOnInit = function () {
    };
    return AboutComponent;
}());
AboutComponent = __decorate([
    __webpack_require__.i(__WEBPACK_IMPORTED_MODULE_0__angular_core__["Component"])({
        selector: 'app-about',
        template: __webpack_require__(478),
        styles: [__webpack_require__(465)]
    }),
    __metadata("design:paramtypes", [])
], AboutComponent);

//# sourceMappingURL=E:/Anupama/new-interface/sisupal/src/about.component.js.map

/***/ }),

/***/ 293:
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_0__angular_core__ = __webpack_require__(1);
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "a", function() { return AppComponent; });
var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};

var AppComponent = (function () {
    function AppComponent() {
        this.title = '';
    }
    return AppComponent;
}());
AppComponent = __decorate([
    __webpack_require__.i(__WEBPACK_IMPORTED_MODULE_0__angular_core__["Component"])({
        selector: 'app-root',
        template: __webpack_require__(479),
        styles: [__webpack_require__(466)]
    })
], AppComponent);

//# sourceMappingURL=E:/Anupama/new-interface/sisupal/src/app.component.js.map

/***/ }),

/***/ 294:
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_0__angular_platform_browser__ = __webpack_require__(50);
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_1__angular_core__ = __webpack_require__(1);
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_2__angular_forms__ = __webpack_require__(30);
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_3__angular_http__ = __webpack_require__(72);
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_4__angular_material__ = __webpack_require__(286);
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_5__angular_router__ = __webpack_require__(95);
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_6__ng_bootstrap_ng_bootstrap__ = __webpack_require__(160);
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_7_ng2_filter_pipe__ = __webpack_require__(460);
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_7_ng2_filter_pipe___default = __webpack_require__.n(__WEBPACK_IMPORTED_MODULE_7_ng2_filter_pipe__);
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_8_ng2_search_filter__ = __webpack_require__(462);
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_9__app_component__ = __webpack_require__(293);
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_10__contact_contact_component__ = __webpack_require__(295);
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_11__slokas_slokas_component__ = __webpack_require__(301);
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_12__sloka_details_sloka_details_component__ = __webpack_require__(300);
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_13__home_home_component__ = __webpack_require__(297);
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_14__about_about_component__ = __webpack_require__(292);
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_15__about_component_about_component_component__ = __webpack_require__(291);
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_16__preface_preface_component__ = __webpack_require__(299);
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_17__poet_poet_component__ = __webpack_require__(298);
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_18__summary_summary_component__ = __webpack_require__(303);
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_19__source_source_component__ = __webpack_require__(302);
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_20__sloka_details_sloka_detail_child_component__ = __webpack_require__(186);
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_21__sloka_service_service__ = __webpack_require__(74);
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_22__summary_service__ = __webpack_require__(187);
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_23_hammerjs__ = __webpack_require__(457);
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_23_hammerjs___default = __webpack_require__.n(__WEBPACK_IMPORTED_MODULE_23_hammerjs__);
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_24__dict_view_dict_view_component__ = __webpack_require__(296);
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "a", function() { return AppModule; });
var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};






//import { DynamicHTMLModule } from '

//import { MarkdownIt } from '@types/markdown-it';













/** child component **/

/** service imports **/




//import 'MarkdownIt';
var appRoutes = [
    { path: 'home', component: __WEBPACK_IMPORTED_MODULE_13__home_home_component__["a" /* HomeComponent */] },
    { path: 'contact', component: __WEBPACK_IMPORTED_MODULE_10__contact_contact_component__["a" /* ContactComponent */] },
    { path: 'canto', component: __WEBPACK_IMPORTED_MODULE_11__slokas_slokas_component__["a" /* SlokasComponent */] },
    { path: 'canto/:id', component: __WEBPACK_IMPORTED_MODULE_12__sloka_details_sloka_details_component__["a" /* SlokaDetailsComponent */] },
    { path: 'about', component: __WEBPACK_IMPORTED_MODULE_14__about_about_component__["a" /* AboutComponent */] },
    { path: 'preface', component: __WEBPACK_IMPORTED_MODULE_16__preface_preface_component__["a" /* PrefaceComponent */] },
    { path: 'summary', component: __WEBPACK_IMPORTED_MODULE_18__summary_summary_component__["a" /* SummaryComponent */] },
    { path: 'source', component: __WEBPACK_IMPORTED_MODULE_19__source_source_component__["a" /* SourceComponent */] },
    { path: 'poet', component: __WEBPACK_IMPORTED_MODULE_17__poet_poet_component__["a" /* PoetComponent */] },
    { path: '**', redirectTo: '/home', pathMatch: 'full' },
    { path: '', redirectTo: '/home', pathMatch: 'full' }
];
var AppModule = (function () {
    function AppModule() {
    }
    return AppModule;
}());
AppModule = __decorate([
    __webpack_require__.i(__WEBPACK_IMPORTED_MODULE_1__angular_core__["NgModule"])({
        declarations: [
            __WEBPACK_IMPORTED_MODULE_9__app_component__["a" /* AppComponent */],
            __WEBPACK_IMPORTED_MODULE_10__contact_contact_component__["a" /* ContactComponent */],
            __WEBPACK_IMPORTED_MODULE_11__slokas_slokas_component__["a" /* SlokasComponent */],
            __WEBPACK_IMPORTED_MODULE_12__sloka_details_sloka_details_component__["a" /* SlokaDetailsComponent */],
            __WEBPACK_IMPORTED_MODULE_13__home_home_component__["a" /* HomeComponent */],
            __WEBPACK_IMPORTED_MODULE_14__about_about_component__["a" /* AboutComponent */],
            __WEBPACK_IMPORTED_MODULE_16__preface_preface_component__["a" /* PrefaceComponent */],
            __WEBPACK_IMPORTED_MODULE_17__poet_poet_component__["a" /* PoetComponent */],
            __WEBPACK_IMPORTED_MODULE_18__summary_summary_component__["a" /* SummaryComponent */],
            __WEBPACK_IMPORTED_MODULE_19__source_source_component__["a" /* SourceComponent */],
            __WEBPACK_IMPORTED_MODULE_20__sloka_details_sloka_detail_child_component__["a" /* SlokaDetailView */],
            __WEBPACK_IMPORTED_MODULE_24__dict_view_dict_view_component__["a" /* DictViewComponent */],
            __WEBPACK_IMPORTED_MODULE_15__about_component_about_component_component__["a" /* AboutComponentComponent */]
        ],
        imports: [
            __WEBPACK_IMPORTED_MODULE_0__angular_platform_browser__["a" /* BrowserModule */],
            __WEBPACK_IMPORTED_MODULE_2__angular_forms__["a" /* FormsModule */],
            __WEBPACK_IMPORTED_MODULE_3__angular_http__["a" /* HttpModule */],
            __WEBPACK_IMPORTED_MODULE_4__angular_material__["a" /* MaterialModule */],
            __WEBPACK_IMPORTED_MODULE_5__angular_router__["a" /* RouterModule */].forRoot(appRoutes, { useHash: true }),
            __WEBPACK_IMPORTED_MODULE_6__ng_bootstrap_ng_bootstrap__["a" /* NgbModule */].forRoot(),
            __WEBPACK_IMPORTED_MODULE_3__angular_http__["b" /* JsonpModule */],
            __WEBPACK_IMPORTED_MODULE_7_ng2_filter_pipe__["Ng2FilterPipeModule"],
            __WEBPACK_IMPORTED_MODULE_8_ng2_search_filter__["a" /* Ng2SearchPipeModule */]
        ],
        providers: [__WEBPACK_IMPORTED_MODULE_21__sloka_service_service__["a" /* SlokaService */], __WEBPACK_IMPORTED_MODULE_22__summary_service__["a" /* SummaryService */]],
        bootstrap: [__WEBPACK_IMPORTED_MODULE_9__app_component__["a" /* AppComponent */]]
    })
], AppModule);

//# sourceMappingURL=E:/Anupama/new-interface/sisupal/src/app.module.js.map

/***/ }),

/***/ 295:
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_0__angular_core__ = __webpack_require__(1);
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "a", function() { return ContactComponent; });
var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
var __metadata = (this && this.__metadata) || function (k, v) {
    if (typeof Reflect === "object" && typeof Reflect.metadata === "function") return Reflect.metadata(k, v);
};

var ContactComponent = (function () {
    function ContactComponent() {
    }
    ContactComponent.prototype.ngOnInit = function () {
    };
    return ContactComponent;
}());
ContactComponent = __decorate([
    __webpack_require__.i(__WEBPACK_IMPORTED_MODULE_0__angular_core__["Component"])({
        selector: 'app-contact',
        template: __webpack_require__(480),
        styles: [__webpack_require__(467)]
    }),
    __metadata("design:paramtypes", [])
], ContactComponent);

//# sourceMappingURL=E:/Anupama/new-interface/sisupal/src/contact.component.js.map

/***/ }),

/***/ 296:
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_0__angular_core__ = __webpack_require__(1);
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_1_jquery__ = __webpack_require__(458);
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_1_jquery___default = __webpack_require__.n(__WEBPACK_IMPORTED_MODULE_1_jquery__);
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_2__sloka_service_service__ = __webpack_require__(74);
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "a", function() { return DictViewComponent; });
var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
var __metadata = (this && this.__metadata) || function (k, v) {
    if (typeof Reflect === "object" && typeof Reflect.metadata === "function") return Reflect.metadata(k, v);
};



var DictViewComponent = (function () {
    function DictViewComponent(slokaService) {
        this.slokaService = slokaService;
        var thiz = this;
        this.window = window;
    }
    DictViewComponent.prototype.ngOnInit = function () {
        this.words = this.name.split('{');
        this.finalWords = this.words[0].split(/[-_]/);
        this.modifiedName = this.name.replace(this.words[0], '');
        localStorage.setItem('u-data', JSON.stringify(this.slokaService.dictUrlData));
        __WEBPACK_IMPORTED_MODULE_1_jquery__(document).ready(function () {
            __WEBPACK_IMPORTED_MODULE_1_jquery__('.sublist li a').click(function (event) {
                var data = event.target.innerHTML;
                data = data.replace(/[0-9]+$/gi, '');
                var urlData = JSON.parse(localStorage.getItem('u-data'));
                var url = urlData.url + data + '&' + urlData.parameters;
                window.open(url, 'DictView', 'width=560,height=340,toolbar=0,menubar=0,location=0');
                event.preventDefault();
            });
        });
    };
    DictViewComponent.prototype.showDic = function (val) {
        var url = 'http://sanskrit.uohyd.ac.in/cgi-bin/scl/e-readers/sbg/options1.cgi?word=' + val;
        window.open(url, 'DictView', 'width=560,height=340,toolbar=0,menubar=0,location=0');
    };
    return DictViewComponent;
}());
__decorate([
    __webpack_require__.i(__WEBPACK_IMPORTED_MODULE_0__angular_core__["Input"])(),
    __metadata("design:type", Object)
], DictViewComponent.prototype, "name", void 0);
DictViewComponent = __decorate([
    __webpack_require__.i(__WEBPACK_IMPORTED_MODULE_0__angular_core__["Component"])({
        selector: 'app-dict-view',
        template: __webpack_require__(481),
        styles: [__webpack_require__(468)]
    }),
    __metadata("design:paramtypes", [typeof (_a = typeof __WEBPACK_IMPORTED_MODULE_2__sloka_service_service__["a" /* SlokaService */] !== "undefined" && __WEBPACK_IMPORTED_MODULE_2__sloka_service_service__["a" /* SlokaService */]) === "function" && _a || Object])
], DictViewComponent);

var _a;
//# sourceMappingURL=E:/Anupama/new-interface/sisupal/src/dict-view.component.js.map

/***/ }),

/***/ 297:
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_0__angular_core__ = __webpack_require__(1);
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "a", function() { return HomeComponent; });
var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
var __metadata = (this && this.__metadata) || function (k, v) {
    if (typeof Reflect === "object" && typeof Reflect.metadata === "function") return Reflect.metadata(k, v);
};

var HomeComponent = (function () {
    function HomeComponent() {
    }
    HomeComponent.prototype.ngOnInit = function () {
    };
    return HomeComponent;
}());
HomeComponent = __decorate([
    __webpack_require__.i(__WEBPACK_IMPORTED_MODULE_0__angular_core__["Component"])({
        selector: 'app-home',
        template: __webpack_require__(482),
        styles: [__webpack_require__(469)]
    }),
    __metadata("design:paramtypes", [])
], HomeComponent);

//# sourceMappingURL=E:/Anupama/new-interface/sisupal/src/home.component.js.map

/***/ }),

/***/ 298:
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_0__angular_core__ = __webpack_require__(1);
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "a", function() { return PoetComponent; });
var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
var __metadata = (this && this.__metadata) || function (k, v) {
    if (typeof Reflect === "object" && typeof Reflect.metadata === "function") return Reflect.metadata(k, v);
};

var PoetComponent = (function () {
    function PoetComponent() {
    }
    PoetComponent.prototype.ngOnInit = function () {
    };
    return PoetComponent;
}());
PoetComponent = __decorate([
    __webpack_require__.i(__WEBPACK_IMPORTED_MODULE_0__angular_core__["Component"])({
        selector: 'app-poet',
        template: __webpack_require__(483),
        styles: [__webpack_require__(470)]
    }),
    __metadata("design:paramtypes", [])
], PoetComponent);

//# sourceMappingURL=E:/Anupama/new-interface/sisupal/src/poet.component.js.map

/***/ }),

/***/ 299:
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_0__angular_core__ = __webpack_require__(1);
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "a", function() { return PrefaceComponent; });
var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
var __metadata = (this && this.__metadata) || function (k, v) {
    if (typeof Reflect === "object" && typeof Reflect.metadata === "function") return Reflect.metadata(k, v);
};

var PrefaceComponent = (function () {
    function PrefaceComponent() {
    }
    PrefaceComponent.prototype.ngOnInit = function () {
    };
    return PrefaceComponent;
}());
PrefaceComponent = __decorate([
    __webpack_require__.i(__WEBPACK_IMPORTED_MODULE_0__angular_core__["Component"])({
        selector: 'app-preface',
        template: __webpack_require__(484),
        styles: [__webpack_require__(471)]
    }),
    __metadata("design:paramtypes", [])
], PrefaceComponent);

//# sourceMappingURL=E:/Anupama/new-interface/sisupal/src/preface.component.js.map

/***/ }),

/***/ 300:
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_0__angular_core__ = __webpack_require__(1);
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_1__angular_router__ = __webpack_require__(95);
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_2__sloka_service_service__ = __webpack_require__(74);
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_3_rxjs_add_operator_switchMap__ = __webpack_require__(131);
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_3_rxjs_add_operator_switchMap___default = __webpack_require__.n(__WEBPACK_IMPORTED_MODULE_3_rxjs_add_operator_switchMap__);
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_4_rxjs_Rx__ = __webpack_require__(491);
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_4_rxjs_Rx___default = __webpack_require__.n(__WEBPACK_IMPORTED_MODULE_4_rxjs_Rx__);
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_5__sloka_detail_child_component__ = __webpack_require__(186);
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "a", function() { return SlokaDetailsComponent; });
var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
var __metadata = (this && this.__metadata) || function (k, v) {
    if (typeof Reflect === "object" && typeof Reflect.metadata === "function") return Reflect.metadata(k, v);
};






var SlokaDetailsComponent = (function () {
    function SlokaDetailsComponent(service, router, route) {
        this.service = service;
        this.router = router;
        this.route = route;
        this.userFilter = { name: '' };
    }
    SlokaDetailsComponent.prototype.ngOnInit = function () {
        var _this = this;
        this.slokaSearch = {
            sloka: ''
        };
        this.loading = true;
        /*let eventObservable = Observable.fromEvent(this.input.nativeElement, 'keyup')
            eventObservable.subscribe(); */
        //console.log(this.route.params['id']);
        this.route.params
            .switchMap(function (params) { return _this.service.getSlokaDetails(+params['id']); })
            .subscribe(function (sloka) { return _this.sloka = sloka; });
        this.route.params
            .switchMap(function (params) {
            return _this.service.getCantoData(params['id']);
        }).subscribe(function (canto) { return _this.canto = canto; }, function (error) { return _this.errorMessage = error; });
        this.loading = false;
        this.route.params
            .switchMap(function (params) {
            return _this.service.getCangoIndex(params['id']);
        }).subscribe(function (index) { return _this.index = index; }, function (error) { return _this.errorMessage = error; });
        this.sub = this.route.params.subscribe(function (params) {
            _this.cantoNumber = +params["id"];
            _this.cantoInfo = "Canto" + _this.cantoNumber;
        });
        this.getTranslationObject();
        if (!this.service.dictUrlData) {
            this.service.getDictUrl().subscribe(function (dictConfig) { return _this.service.dictUrlData = dictConfig; }, function (error) { return _this.errorMessage = error; });
        }
    };
    SlokaDetailsComponent.prototype.gotoSlokas = function () {
        var slokaId = null;
        this.router.navigate(['/canto', { id: slokaId }]);
    };
    SlokaDetailsComponent.prototype.isSelected = function (sloka) {
        return (this.slokaNo === +sloka.slokaNo);
    };
    SlokaDetailsComponent.prototype.selectSloka = function (sloka) {
        if (this.slokaList == undefined)
            this.slokaList = [];
        if (this.slokaList != undefined && this.slokaList.length === 0) {
            this.slokaList = this.canto;
        }
        this.canto = Object.assign([], this.slokaList).filter(function (sloka) { return sloka.slokaNo === sloka.slokaNo; });
        this.canto = [];
        var index = +sloka.slokaNo;
        this.slokaNo = index;
        this.canto.push(this.slokaList[index - 1]);
    };
    SlokaDetailsComponent.prototype.showAll = function () {
        if (this.canto.length == 1) {
            this.canto[0].show = false;
            this.canto = Object.assign([], this.slokaList);
            this.slokaNo = 0;
        }
    };
    SlokaDetailsComponent.prototype.showView = function (item) {
        this.resetExpandView(item);
        this.previouSloka = item;
        item.show = !item.show;
        setTimeout(function () {
            var num = +item.slokaNo;
            var el = document.getElementById(num > 0 ? num - 1 + '' : num + '');
            if (item.show && el)
                el.scrollIntoView();
        }.bind(this, item), 1200);
    };
    SlokaDetailsComponent.prototype.resetExpandView = function (item) {
        if (this.previouSloka != undefined && item.slokaNo != this.previouSloka.slokaNo)
            this.previouSloka.show = false;
    };
    // getSlokaTranslation
    SlokaDetailsComponent.prototype.getSlokaTranslation = function (id) {
        var slokaNumber = "SV-" + id;
        return this.slokaTranslation.cantoList[slokaNumber];
        //return this.slokaTranslation[slokaNumber];
    };
    SlokaDetailsComponent.prototype.getAdditionalInfo = function (id, num) {
        return this.slokaTranslation.otherInfo["SV-" + id + "row" + num].join(" ");
    };
    SlokaDetailsComponent.prototype.getTranslationObject = function () {
        var _this = this;
        this.route.params
            .switchMap(function (params) {
            return _this.service.getSlokaTranslation(params['id']);
        }).subscribe(function (slokaTranslation) { return _this.slokaTranslation = slokaTranslation; }, function (error) { return _this.errorMessage = error; });
    };
    return SlokaDetailsComponent;
}());
__decorate([
    __webpack_require__.i(__WEBPACK_IMPORTED_MODULE_0__angular_core__["ViewChild"])('input'),
    __metadata("design:type", typeof (_a = typeof __WEBPACK_IMPORTED_MODULE_0__angular_core__["ElementRef"] !== "undefined" && __WEBPACK_IMPORTED_MODULE_0__angular_core__["ElementRef"]) === "function" && _a || Object)
], SlokaDetailsComponent.prototype, "input", void 0);
__decorate([
    __webpack_require__.i(__WEBPACK_IMPORTED_MODULE_0__angular_core__["ViewChild"])(__WEBPACK_IMPORTED_MODULE_5__sloka_detail_child_component__["a" /* SlokaDetailView */]),
    __metadata("design:type", typeof (_b = typeof __WEBPACK_IMPORTED_MODULE_5__sloka_detail_child_component__["a" /* SlokaDetailView */] !== "undefined" && __WEBPACK_IMPORTED_MODULE_5__sloka_detail_child_component__["a" /* SlokaDetailView */]) === "function" && _b || Object)
], SlokaDetailsComponent.prototype, "slokaDetailView", void 0);
SlokaDetailsComponent = __decorate([
    __webpack_require__.i(__WEBPACK_IMPORTED_MODULE_0__angular_core__["Component"])({
        selector: 'app-sloka-details',
        template: __webpack_require__(486),
        styles: [__webpack_require__(473)]
        //directives : [SlokaDetailView]
    }),
    __metadata("design:paramtypes", [typeof (_c = typeof __WEBPACK_IMPORTED_MODULE_2__sloka_service_service__["a" /* SlokaService */] !== "undefined" && __WEBPACK_IMPORTED_MODULE_2__sloka_service_service__["a" /* SlokaService */]) === "function" && _c || Object, typeof (_d = typeof __WEBPACK_IMPORTED_MODULE_1__angular_router__["b" /* Router */] !== "undefined" && __WEBPACK_IMPORTED_MODULE_1__angular_router__["b" /* Router */]) === "function" && _d || Object, typeof (_e = typeof __WEBPACK_IMPORTED_MODULE_1__angular_router__["c" /* ActivatedRoute */] !== "undefined" && __WEBPACK_IMPORTED_MODULE_1__angular_router__["c" /* ActivatedRoute */]) === "function" && _e || Object])
], SlokaDetailsComponent);

var _a, _b, _c, _d, _e;
/*
@Pipe({

    name:'searchPipe',
    pure:false
})

export class SearchPipe implements PipeTransform{
    transform(canto:SlokaTest[], searchTerm:string):SlokaTest[]{
        
        return canto.filter(item=> {
         //   console.log(item);
            item.sloka.indexOf(searchTerm) !== -1;
        
        });
    }

}
*/ 
//# sourceMappingURL=E:/Anupama/new-interface/sisupal/src/sloka-details.component.js.map

/***/ }),

/***/ 301:
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_0__angular_core__ = __webpack_require__(1);
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_1__angular_router__ = __webpack_require__(95);
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_2__sloka_service_service__ = __webpack_require__(74);
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "a", function() { return SlokasComponent; });
var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
var __metadata = (this && this.__metadata) || function (k, v) {
    if (typeof Reflect === "object" && typeof Reflect.metadata === "function") return Reflect.metadata(k, v);
};



var SlokasComponent = (function () {
    //  errorMessage:error<any>;
    function SlokasComponent(router, service) {
        this.router = router;
        this.service = service;
    }
    SlokasComponent.prototype.ngOnInit = function () {
        this.slokas = this.service.getSlokas();
        this.service.getSummary(); //.subscribe(summary => this.summary = summary, error => this.errorMessage = error<any>);
    };
    SlokasComponent.prototype.onSelect = function (sloka) {
        if (sloka.enabled) {
            this.router.navigate(['/canto/' + sloka.id]);
        }
    };
    SlokasComponent.prototype.isSelected = function (sloka) {
        //return true; 
        return sloka.enabled === true; //? 'Click to View Canto information' : 'No info available for canto'+sloka.id;
    };
    return SlokasComponent;
}());
SlokasComponent = __decorate([
    __webpack_require__.i(__WEBPACK_IMPORTED_MODULE_0__angular_core__["Component"])({
        selector: 'app-slokas',
        template: __webpack_require__(487),
        styles: [__webpack_require__(474)]
    }),
    __metadata("design:paramtypes", [typeof (_a = typeof __WEBPACK_IMPORTED_MODULE_1__angular_router__["b" /* Router */] !== "undefined" && __WEBPACK_IMPORTED_MODULE_1__angular_router__["b" /* Router */]) === "function" && _a || Object, typeof (_b = typeof __WEBPACK_IMPORTED_MODULE_2__sloka_service_service__["a" /* SlokaService */] !== "undefined" && __WEBPACK_IMPORTED_MODULE_2__sloka_service_service__["a" /* SlokaService */]) === "function" && _b || Object])
], SlokasComponent);

var _a, _b;
//# sourceMappingURL=E:/Anupama/new-interface/sisupal/src/slokas.component.js.map

/***/ }),

/***/ 302:
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_0__angular_core__ = __webpack_require__(1);
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_1_marked__ = __webpack_require__(459);
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_1_marked___default = __webpack_require__.n(__WEBPACK_IMPORTED_MODULE_1_marked__);
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "a", function() { return SourceComponent; });
var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
var __metadata = (this && this.__metadata) || function (k, v) {
    if (typeof Reflect === "object" && typeof Reflect.metadata === "function") return Reflect.metadata(k, v);
};


var SourceComponent = (function () {
    function SourceComponent() {
        this.data = "# karunakar";
        this.data = __WEBPACK_IMPORTED_MODULE_1_marked___default()(this.data);
    }
    SourceComponent.prototype.ngOnInit = function () {
        this.mpsp = 33;
    };
    SourceComponent.prototype.showMPSP = function (mpsp) {
        this.mpsp = mpsp;
    };
    return SourceComponent;
}());
SourceComponent = __decorate([
    __webpack_require__.i(__WEBPACK_IMPORTED_MODULE_0__angular_core__["Component"])({
        selector: 'app-source',
        template: __webpack_require__(488),
        styles: [__webpack_require__(475)]
    }),
    __metadata("design:paramtypes", [])
], SourceComponent);

//# sourceMappingURL=E:/Anupama/new-interface/sisupal/src/source.component.js.map

/***/ }),

/***/ 303:
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_0__angular_core__ = __webpack_require__(1);
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_1__summary_service__ = __webpack_require__(187);
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "a", function() { return SummaryComponent; });
var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
var __metadata = (this && this.__metadata) || function (k, v) {
    if (typeof Reflect === "object" && typeof Reflect.metadata === "function") return Reflect.metadata(k, v);
};


var SummaryComponent = (function () {
    function SummaryComponent(service) {
        this.service = service;
    }
    SummaryComponent.prototype.ngOnInit = function () {
        this.getSummary();
        this.selected = "canto1";
    };
    SummaryComponent.prototype.getSummary = function () {
        var _this = this;
        this.service.getSummaryList()
            .subscribe(function (data) { return _this.data = data; }, function (error) { return _this.errorMessage = error; });
    };
    SummaryComponent.prototype.onSelect = function (summary) {
        this.selected = summary.name;
    };
    SummaryComponent.prototype.isSelected = function (summary) {
        return this.selected === summary.name;
    };
    return SummaryComponent;
}());
SummaryComponent = __decorate([
    __webpack_require__.i(__WEBPACK_IMPORTED_MODULE_0__angular_core__["Component"])({
        selector: 'app-summary',
        template: __webpack_require__(489),
        styles: [__webpack_require__(476)]
    }),
    __metadata("design:paramtypes", [typeof (_a = typeof __WEBPACK_IMPORTED_MODULE_1__summary_service__["a" /* SummaryService */] !== "undefined" && __WEBPACK_IMPORTED_MODULE_1__summary_service__["a" /* SummaryService */]) === "function" && _a || Object])
], SummaryComponent);

var _a;
//# sourceMappingURL=E:/Anupama/new-interface/sisupal/src/summary.component.js.map

/***/ }),

/***/ 304:
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "a", function() { return environment; });
var environment = {
    production: true
};
//# sourceMappingURL=E:/Anupama/new-interface/sisupal/src/environment.prod.js.map

/***/ }),

/***/ 464:
/***/ (function(module, exports) {

module.exports = ""

/***/ }),

/***/ 465:
/***/ (function(module, exports) {

module.exports = ".alist label {\r\n\tfont-size:15px;\r\n\tfont-weight:bold;\r\n}\r\n.alist label:before{\r\n\tcontent:\"> \"\r\n}\r\n.alist label:ater {\r\n\tcontent:\" :\";\r\n}"

/***/ }),

/***/ 466:
/***/ (function(module, exports) {

module.exports = ".navbar {\r\n    border-radius: 0 !important;\r\n}\r\n\r\n.body {\r\n    margin-top: 5%;\r\n}\r\n\r\n.nav-item a {\r\n    padding-left: 5px;\r\n    font-family: calibri;\r\n    font-size: 18px;\r\n}\r\n\r\nbody,\r\nhtml,\r\np,\r\ndiv,\r\na,\r\nspan,\r\nh1,\r\nh2,\r\nh3,\r\nh4,\r\nh5,\r\nli,\r\nul,\r\ninput[type='text'] {\r\n    font-family: Calibri;\r\n    font-size: 16px;\r\n}\r\n\r\n.menu {\r\n    width: 100%;\r\n    float: right;\r\n}\r\n\r\n.spacer {\r\n    -webkit-box-flex: 1;\r\n    -ms-flex: 1 1 auto;\r\n    flex: 1 1 auto;\r\n}"

/***/ }),

/***/ 467:
/***/ (function(module, exports) {

module.exports = ".spacer {\r\n    -webkit-box-flex: 1;\r\n    -ms-flex: 1 1 auto;\r\n    flex: 1 1 auto;\r\n}\r\n\r\n.card{\r\n    \r\n    height:400px;\r\n}"

/***/ }),

/***/ 468:
/***/ (function(module, exports) {

module.exports = ".sublist {list-style-type:none;} .sublist li { display:inline; padding:0;} .sublist li:after { content: \"-\"} \r\n  .sublist li:last-child:after { content:\"\";}\r\n  .sub:last-child:after { content:\"\"}\r\n  \r\n  .sub { color:blue; cursor:pointer;}"

/***/ }),

/***/ 469:
/***/ (function(module, exports) {

module.exports = ".img {\r\n    margin-top: 20px;\r\n    width: 400px;\r\n    height: 270px;\r\n}\r\n\r\n.text {\r\n    top: 4.2em;\r\n}\r\n\r\n.background {\r\n    padding: 10px;\r\n}"

/***/ }),

/***/ 470:
/***/ (function(module, exports) {

module.exports = ""

/***/ }),

/***/ 471:
/***/ (function(module, exports) {

module.exports = ""

/***/ }),

/***/ 472:
/***/ (function(module, exports) {

module.exports = ".A {\r\n    background: #ccffff;\r\n}\r\n\r\n.B {\r\n    background: #00FF7F;\r\n}\r\n\r\n.n1 {\r\n    background-color: #ccffff;\r\n}\r\n\r\n.n2 {\r\n    background-color: #00FF7F;\r\n    /*cadetblue*/\r\n}\r\n\r\n.n3 {\r\n    background-color: #eb613d;\r\n    /*lightpink*/\r\n}\r\n\r\n.n4 {\r\n    background-color: #e6ff00;\r\n    /*lightgolden*/\r\n}\r\n\r\n.n5 {\r\n    background-color: #1E90FF;\r\n    /*aquamarine*/\r\n}\r\n\r\n.n6 {\r\n    background-color: #FF69B4;\r\n    /*peach*/\r\n}\r\n\r\n.n7 {\r\n    background-color: #BC8F8F;\r\n    /*slategray*/\r\n}\r\n\r\n.v {\r\n    background-color: #FE6265;\r\n    /*darkseagreen*/\r\n}\r\n\r\n.i {\r\n    background-color: rgb(255, 240, 245);\r\n    /* lavender */\r\n}\r\n\r\n.n8 {\r\n    background-color: rgb(192, 255, 193);\r\n    /*darkseagreen #C0FFC1*/\r\n}\r\n\r\n.NA {\r\n    background-color: rgb(233, 207, 236);\r\n    /*lavendar  #E9CFEC(E6E6FA)*/\r\n}\r\n\r\n.help {\r\n    width: 25px;\r\n    height: 25px;\r\n    border-radius: 50%;\r\n    float: left\r\n}\r\n\r\n.hint {\r\n    width: 150px;\r\n    float: left;\r\n}\r\n\r\n.helpBar {\r\n    padding: 6px;\r\n}\r\n\r\n.helpBar div {\r\n    padding: 2px 5px;\r\n}\r\n\r\n.table {\r\n    float: left;\r\n    width: auto !important;\r\n    font-size: 13px;\r\n}\r\n\r\n.modal-dialog {\r\n    width: 100% !important;\r\n    margin: 30px auto;\r\n    max-width: 100% !important;\r\n}\r\n\r\n@media (min-width: 576px) .modal-dialog {\r\n    max-width: auto !important;\r\n    margin: 30px auto;\r\n}\r\n\r\n.modal-lg {\r\n    max-width: 80% !important;\r\n}\r\n\r\ntd span a {\r\n\tcolor:blue !important;\r\n}"

/***/ }),

/***/ 473:
/***/ (function(module, exports) {

module.exports = "  .card {\r\n      margin-top: 5px;\r\n  }\r\n  \r\n  .list .list-group-item {\r\n      margin-top: 7px;\r\n      box-shadow: 0 2px 5px 0 rgba(0, 0, 0, .16), 0 2px 10px 0 rgba(0, 0, 0, .12);\r\n      /*cursor: pointer;*/\r\n  }\r\n  \r\n  .link {\r\n\t  cursor:pointer;\r\n  }\r\n  .list {\r\n      box-shadow: none;\r\n  }\r\n  \r\n  .items li {\r\n      font-size: 12.5px;\r\n  }"

/***/ }),

/***/ 474:
/***/ (function(module, exports) {

module.exports = ".items {\r\n    list-style-type: none;\r\n    padding: 2px;\r\n}\r\n\r\n.items li {\r\n    padding: 1.3em 0 !important;\r\n}\r\n\r\n.items.selected {\r\n    /* background:#efefef;\r\n    // color: #fff; */\r\n}\r\n\r\n.selected li {\r\n    background: #5782a5;\r\n    color: #fff;\r\n}\r\n\r\n.hide {\r\n    display:none;\r\n}"

/***/ }),

/***/ 475:
/***/ (function(module, exports) {

module.exports = ""

/***/ }),

/***/ 476:
/***/ (function(module, exports) {

module.exports = "#padding {\r\n    margin-top: 20px !important;\r\n    padding: 15px;\r\n    text-align: justify;\r\n    font-family: 'calibri', monospace, 'monaco';\r\n}\r\n\r\n.tab-content {\r\n    padding: 2em !important;\r\n    text-align: justify;\r\n}"

/***/ }),

/***/ 477:
/***/ (function(module, exports) {

module.exports = "<p>\r\n  about-component works!\r\n</p>\r\n"

/***/ }),

/***/ 478:
/***/ (function(module, exports) {

module.exports = "<div class=\"col-md-12\">\r\n    <ol class=\"breadcrumb\">\r\n        <li class=\"breadcrumb-item\"> <a routerLink=\"/home\" routerLinkActive=\"true\">Home</a></li>\r\n        <li class=\"breadcrumb-item active\">About Us</li>\r\n    </ol>\r\n\r\n\r\n\r\n    <div class=\"intro-text animated slideInRight\">\r\n\t\r\n\t\t<p>\r\n\t\t\tThis e-reader is a project of Post Doctoral Research approved by U.G.C., on <code> Śiśupālavadha of Māgha (Pūrvārdha) </code>\r\n\t\t\tthrough a complete computational linguistic approach, which is done by Dr.Anupama Ryali, under the mentorship of \r\n\t\t\t<code> Prof. Amba Kulkarni </code>. It helps those Sanskrit lovers, who want to learn or teach the Kāvya. Several tools for analysis\r\n\t\t\tof Sanskrit texts have been made available by the Department of Sanskrit Studies, the University of Hyderabad, Hyderabad.\r\n\t\t\tUse of these tools will facilitate the poetic usability for a linguist and also for a learner. Thus using these tools, \r\n\t\t\ta complete analysis of <code> Śiśupālavadha of Māgha (Pūrvārdha) </code>is developed by creating an interface, which serves the entire\r\n\t\t\tpurpose of pedagogy that includes research, education, teaching, learning, and evaluation. The work is available \r\n\t\t\tat <a href=\"http://scl.samsaadhanii.in/scl/e-readers/shishu/\" target=\"_blank\"> http://scl.samsaadhanii.in/scl/e-readers/shishu/ </a>\r\n\t\t\tWith a click on a button, one can access this e-reader with the following features-\r\n\t\t</p>\r\n\t\t\r\n\t\t\t<ul class=\"alist\"> \r\n\t\t\t\t<label> Summaries</label>\r\n\t\t\t\t<li>Padavibhāga, Anvaya, Hindi and English translations of every verse.</li>\r\n\t\t\t\t<li> The summary of each canto in the Sanskrit, Hindi, and English languages.</li>\r\n\t\t\t</ul>\r\n\t\t\t<ul class=\"alist\">\r\n\t\t\t\t<label>Search Options of </label>\r\n\t\t\t\t<li> Any verse or its number from any canto.</li>\r\n\t\t\t\t<li>\tThe verses in both the chronological and the alphabetical order.</li>\r\n\t\t\t</ul>\r\n\t\t\t<ul class=\"alist\"> \r\n\t\t\t\t<label>Hyper-Links </label>\r\n\t\t\t\t<li> Link to the dictionaries for meanings of the words.</li>\r\n\t\t\t\t<li>Graphical display of complete sentential analysis (kāraka analysis).\r\n\t\t\t\t<li> Graphical display of compounds.\r\n\t\t\t</ul>\r\n\t\t\t<ul class=\"alist\"> \r\n\t\t\t<label> Pop up information of </label>\r\n\t\t\t\t<li> Pāṇini’s sūtras as found in Mallinātha’s commentary.\r\n\t\t\t</ul>\r\n\t\t\t<ul class=\"alist\">\r\n\t\t\t<label>Information of </label>\r\n\t\t<li>The poet and the source epic.\r\n\t\t<li>Morphological Analysis (śabdaviśleṣaṇa) of every word given by anusāraka.\r\n\t\t<li>Verbatim meaning in Hindi and English.\r\n\t\t<li>Alaṅkāras, as found in Mallinātha’s commentary.\r\n\t\t<li>Chandas/Vṛttam for every śloka.\r\n\t\t</ul>\r\n\t\t\r\n\t\t\r\n    </div>\r\n</div>"

/***/ }),

/***/ 479:
/***/ (function(module, exports) {

module.exports = "<!-- <md-toolbar color=\"primary\">\r\n    <span>शिशुपालवधम् - माघः (Śiśupālavadha of Māgha)</span>\r\n    <span class=\"spacer\"></span>\r\n    <button md-icon-button [mdMenuTriggerFor]=\"menu\" md->\r\n        <md-icon>more_vert</md-icon>\r\n    </button>\r\n    <md-menu #menu=\"mdMenu\">\r\n\r\n        <li class=\"nav-item\"> <a class=\"nav-link\" routerLink=\"/home\" routerLinkActive=\"true\">Home</a> </li>\r\n\r\n            <li class=\"nav-item\"> <a class=\"nav-link\" routerLink=\"/about\" routerLinkActive=\"true\">About</a></li>\r\n\r\n            <li class=\"nav-item\"> <a class=\"nav-link\" routerLink=\"/preface\" routerLinkActive=\"true\">Preface</a></li>\r\n\r\n            <li class=\"nav-item\"> <a class=\"nav-link\" routerLink=\"/canto\" routerLinkActive=\"true\">Cantos</a></li>\r\n\r\n            <li class=\"nav-item\"> <a class=\"nav-link\" routerLink=\"/poet\" routerLinkActive=\"true\">The Poet</a></li>\r\n\r\n            <li class=\"nav-item\"> <a class=\"nav-link\" routerLink=\"/source\" routerLinkActive=\"true\">Source Epic</a></li>\r\n\r\n            <li class=\"nav-item\"> <a class=\"nav-link\" routerLink=\"/summary\" routerLinkActive=\"true\">Summaries</a></li>\r\n\r\n\r\n            <li class=\"nav-item\"> <a class=\"nav-link\" routerLink=\"/contact\" routerLinkActive=\"true\">Contact Us</a> </li> \r\n\r\n        <button md-menu-item routerLink=\"/home\" routerLinkActive=\"true\">\r\n            <md-icon>home</md-icon>\r\n            <span>Home</span>\r\n        </button>\r\n\r\n        <button md-menu-item routerLink=\"/about\" routerLinkActive=\"true\">\r\n            <md-icon>fingerprint</md-icon>\r\n            <span>About</span>\r\n        </button>\r\n\r\n        <button md-menu-item routerLink=\"/preface\" routerLinkActive=\"true\">\r\n            <md-icon>fingerprint</md-icon>\r\n            <span>Preface</span>\r\n        </button>\r\n\r\n        <button md-menu-item routerLink=\"/canto\" routerLinkActive=\"true\">\r\n            <md-icon>fingerprint</md-icon>\r\n            <span>Cantos</span>\r\n        </button>\r\n\r\n        <button md-menu-item routerLink=\"/poet\" routerLinkActive=\"true\">\r\n            <md-icon>fingerprint</md-icon>\r\n            <span>The Poet</span>\r\n        </button>\r\n\r\n        <button md-menu-item routerLink=\"/source\" routerLinkActive=\"true\">\r\n            <md-icon>fingerprint</md-icon>\r\n            <span>Source</span>\r\n        </button>\r\n\r\n        <button md-menu-item routerLink=\"/summary\" routerLinkActive=\"true\">\r\n            <md-icon>fingerprint</md-icon>\r\n            <span>Summary</span>\r\n        </button>\r\n\r\n    </md-menu>\r\n</md-toolbar> -->\r\n\r\n<nav class=\"navbar navbar-toggleable-md navbar-inverse bg-inverse fixed-top\">\r\n    <button class=\"navbar-toggler navbar-toggler-right\" type=\"button\" data-toggle=\"collapse\" data-target=\"#navbarSupportedContent\" aria-controls=\"navbarSupportedContent\" aria-expanded=\"false\" aria-label=\"Toggle navigation\">\r\n        <span class=\"navbar-toggler-icon\"></span>\r\n    </button>\r\n    <a class=\"navbar-brand\" href=\"#\"><span class=\"name\">शिशुपालवधम् - माघः (पूर्वार्धम्)  - ŚIŚUPĀLAVADHA OF MĀGHA (Pūrvārdha)</span></a>\r\n\r\n    <div class=\"collapse navbar-collapse\" id=\"navbarSupportedContent\">\r\n        <ul class=\"justify-content-center nav navbar-nav mr-auto  menu\">\r\n\r\n            <li class=\"nav-item\"> <a class=\"nav-link\" routerLink=\"/home\" routerLinkActive=\"true\">Home</a> </li>\r\n\r\n            <li class=\"nav-item\"> <a class=\"nav-link\" routerLink=\"/about\" routerLinkActive=\"true\">About</a></li>\r\n\r\n            <li class=\"nav-item\"> <a class=\"nav-link\" routerLink=\"/preface\" routerLinkActive=\"true\">Preface</a></li>\r\n\r\n            <li class=\"nav-item\"> <a class=\"nav-link\" routerLink=\"/canto\" routerLinkActive=\"true\">Cantos</a></li>\r\n\r\n            <li class=\"nav-item\"> <a class=\"nav-link\" routerLink=\"/poet\" routerLinkActive=\"true\">The Poet</a></li>\r\n\r\n            <li class=\"nav-item\"> <a class=\"nav-link\" routerLink=\"/source\" routerLinkActive=\"true\">Source Epic</a></li>\r\n\r\n            <li class=\"nav-item\"> <a class=\"nav-link\" routerLink=\"/summary\" routerLinkActive=\"true\">Summaries</a></li>\r\n\r\n\r\n            <li class=\"nav-item\"> <a class=\"nav-link\" routerLink=\"/contact\" routerLinkActive=\"true\">Contact Us</a> </li>\r\n        </ul>\r\n        <!-- <form class=\"form-inline my-2 my-lg-0\">\r\n            <input class=\"form-control mr-sm-2\" type=\"text\" placeholder=\"Search\">\r\n            <button class=\"btn btn-outline-success my-2 my-sm-0\" type=\"submit\">Search</button>\r\n        </form> -->\r\n    </div>\r\n</nav>\r\n\r\n<!-- \r\n<nav class=\"navbar navbar-inverse bg-inverse sticky-top \">\r\n    <button class=\"navbar-toggler navbar-toggler-right\" type=\"button\" data-toggle=\"collapse\" data-target=\"#navbarSupportedContent\" aria-controls=\"navbarSupportedContent\" aria-expanded=\"false\" aria-label=\"Toggle navigation\">\r\n        <span class=\"navbar-toggler-icon\"></span>\r\n    </button>\r\n    <a class=\"navbar-brand\" href=\"#\">{{title}}</a>\r\n\r\n    <div class=\"navbar-collapse\" id=\"navbarSupportedContent\">\r\n\r\n        <ul class=\" nav nav- \">\r\n            <li class=\"nav-item\"> <a class=\"nav-link\" routerLink=\"/home\" routerLinkActive=\"true\">Home</a> </li>\r\n            <li class=\"nav-item\"> <a class=\"nav-link\" routerLink=\"/about\" routerLinkActive=\"true\">About</a></li>\r\n            <li class=\"nav-item\"> <a class=\"nav-link\" routerLink=\"/canto\" routerLinkActive=\"true\">Cantos</a></li>\r\n            <li class=\"nav-item\"> <a class=\"nav-link\" routerLink=\"/contact\" routerLinkActive=\"true\">Contact</a> </li>\r\n\r\n        </ul>\r\n\r\n    </div>\r\n\r\n\r\n</nav>\r\n\r\n  -->\r\n<div class=\"container-fluid body \">\r\n\r\n    <router-outlet></router-outlet>\r\n\r\n\r\n</div>\r\n\r\n\r\n\r\n<footer class=\"footer\">\r\n    <div class=\"container\">\r\n        <p class=\"text-muted\"> &copy; 2013-2018 : Dr. Ryali Anupama </p>\r\n    </div>\r\n</footer>"

/***/ }),

/***/ 480:
/***/ (function(module, exports) {

module.exports = "<div class=\"col-md-12\">\r\n    <ol class=\"breadcrumb\">\r\n        <li class=\"breadcrumb-item\"> <a routerLink=\"/home\" routerLinkActive=\"true\">Home</a></li>\r\n        <li class=\"breadcrumb-item active\">Contact</li>\r\n    </ol>\r\n    <div class=\"container\">\r\n        \r\n        <div class=\"row col-md-12 \">\r\n            <div class=\"col-md-6\">\r\n                <div class=\"card\">\r\n                    \r\n                     <img src=\"https://maps.googleapis.com/maps/api/staticmap?center=17.479654,78.31976&markers=color:red%7Clabel:C%7C17.479654,78.31976&zoom=12&size=600x450\"/>\r\n                \r\n                </div>\r\n            </div>\r\n            <div class=\"col-md-6\">\r\n                <div class=\"card\">\r\n\r\n    <!--Card content-->\r\n    <div class=\"card-block\">\r\n        <!--Title-->\r\n      <!--   <h4 class=\"card-title\">Contact US</h4> <br/> -->\r\n        <!--Text-->\r\n        <h4 class=\"card-title\"> Dr.Anupama Ryali</h4>\r\n        \r\n         <div class=\"col-12\">\r\n             <h4 class=\"card-title\"> <b>Email:</b></h4>\r\n              <p class=\"card-text\">\r\n                anupamaskt@gmail.com \r\n            </p>\r\n            <!-- <h5 class=\"card-title\"><b> Address:</b></h5>\r\n           <p  class=\"card-text\"> Department of Sanskrit Studies,\r\n            University of Hyderabad,\r\n            Hyderabad \r\n          </p> -->\r\n        </div>\r\n      </div>\r\n    <!--/.Card content-->\r\n</div>\r\n            </div>\r\n\t\t\t</div>\r\n</div>"

/***/ }),

/***/ 481:
/***/ (function(module, exports) {

module.exports = "\n  <ul class=\"sublist\">\n  <li [innerHTML]=\"name\"></li>\n  <!--<li class=\"sub\" *ngFor=\"let fword of finalWords\" (click)=showDic(fword) > {{fword}} </li>\n  <li>{{modifiedName}} </li> -->\n  </ul>"

/***/ }),

/***/ 482:
/***/ (function(module, exports) {

module.exports = "<div class=\"col-md-12 intro-text animated fadeIn\">\r\n    <div class=\"col-md-12 text-center\">\r\n        <h2> <span class=\"name\">शिशुपालवधम् - माघः (पूर्वार्धम्)  - ŚIŚUPĀLAVADHA OF MĀGHA (Pūrvārdha)</span></h2>\r\n    </div>\r\n    <div class=\"col-md-12 row background \">\r\n        <div class=\"col-lg-6 col-md-6 col-xs-12 col-sm-12 animated fadeInLeft text-center\">\r\n            <img src=\"assets/cover.jpg\" class=\"img-responsive img\">\r\n        </div>\r\n        <div class=\"col-lg-6 col-md-6 col-xs-12 col-sm-12 animated fadeInRight text\">\r\n            <p>\r\n                    Welcome to the e-version of <code>Śiśupālavadha of Māgha</code>. \r\n                    The e-version captures salient features of understanding Sanskrit poetry viz., \r\n                    Padavibhāgaḥ, anvayaḥ, word analysis, syntactical relation, grammatical function, \r\n                    Kāraka analysis, Samāsa, Sandhi split, Alaṅkāra, Vṛttam, Hindi and English translation, \r\n                    hyperlink to dictionaries, Amarakośa, a pop-up feature on Vyākaraṇa aspects from \r\n                    Mallinātha's commentary etc. The Samāsa-vigraḥ is available as a tool-tip along with the \r\n                    picture showing the composition. Graphical representation of the Kāraka, as well as \r\n                    Samāsa analysis, is provided. The Kāraka analysis is available as a link to the \r\n                    sentence numbers.\r\n            </p>\r\n        </div>\r\n    </div>\r\n    <!-- <div class=\"col-md-12 text-center\">\r\n        <button class=\"btn btn-lg btn-danger\" ng-click=\"home()\">Śiśupālavadha of Māgha</button>\r\n    </div> -->\r\n\r\n</div>\r\n\r\n\r\n"

/***/ }),

/***/ 483:
/***/ (function(module, exports) {

module.exports = "<div class=\"col-md-12\">\r\n    <ol class=\"breadcrumb\">\r\n        <li class=\"breadcrumb-item\"> <a routerLink=\"/home\" routerLinkActive=\"true\">Home</a></li>\r\n        <li class=\"breadcrumb-item active\">Poet</li>\r\n    </ol>\r\n    <div class=\"intro-text animated slideInUp\">\r\n        <p>\r\n\t\t\t\tMāgha's Śiśupālavadha occupies a prominent place among the Kāvyas of Bṛhattrayī and Pañcamahākāvyas of Sanskrit literature. Though it is the only known available work of the poet, he is renowned as Mahākavi, as it possesses all the virtues of a Mahākāvya. This work closes with the words, <code> 'इति श्रीभिन्नमालवास्तव्यदत्तकसूनोर्महावैय्याकरणस्य माघस्य कृतौ शिशुपालवधे.' </code>. In these closing stanzas, he discloses about his clan with one or two particulars that he was the son of Dattaka and grandson of Suprabhadeva, where the latter was the chief minister at the court of king Śrī Varmala.\r\n\t\t  </p>\r\n        <p>The word <code> 'महावैय्याकरणस्य' </code> in the above extract shows that the poet earned the reputation of being erudite in the science of Vyākaraṇa. Moreover, one can evidence his mastery of the science of Vyākaraṇa by his work itself. The variety of grammatical forms and constructions which he uses, the illustrations and similitudes with which he embellishes or substantiates his ideas throughout the poem, the learned discussion on the morality and expediency of war in the second canto – all these bear ample testimony to his thorough acquaintance with the subject and thus, undoubtedly can be proclaimed as a profound scholar.\r\n        </p>\r\n        <p>\r\n\t\tThus, being a very celebrated poet, he accommodated, in this grand epic, various aspects of many Śāstras such as Vyākaraṇa, Rājanīti, Arthaśāstra, Dharmaśāstra, Kāmaśāstra, Jyautiṣa, Saṅgīta, Pākaśāstra, Hastividyā, Aśvaśāstra, Purāṇas, etc. The Kāvya endows with the three virtues of the best Kāvya, i.e., Upamā of Kālidāsa, Arthagauravam of Bhāravi and Padalālityam of Daṇḍi. Hence, the popular notion 'Māghe santi trayo guṇāḥ' came into existence. Mallinātha a famous commentator of this work, quoted on Māgha, 'Navasarge gate māghe nava śabdo na vidyate' i.e., one who completes reading nine cantos of Māgha, will not find a new word to read. He also quoted that he lost his age while reading Māghakāvya and Meghadūta - 'māghe meghe vayaḥ gataḥ.' Thus the greatness of Māghakāvya.\r\n\t\t</p>\r\n    </div>\r\n</div>\r\n"

/***/ }),

/***/ 484:
/***/ (function(module, exports) {

module.exports = "<div class=\"col-md-12\">\r\n    <ol class=\"breadcrumb\">\r\n        <li class=\"breadcrumb-item\"> <a routerLink=\"/home\" routerLinkActive=\"true\">Home</a></li>\r\n        <li class=\"breadcrumb-item active\">Preface</li>\r\n    </ol>\r\n    <div class=\"intro-text animated slideInDown\">\r\n\t\t<p>The method of teaching and learning of various studies, in the modern era, \r\n\t\t\tis emerging out in e-learning and e-teaching in a different arena of knowledge systems and is \r\n\t\t\tcreating a remarkable up gradation in the field of education. For a language like Sanskrit which \r\n\t\t\thas vast literature in the form of published books and unpublished manuscripts, electronic data \r\n\t\t\tmarks a way of extending the longevity of Sanskrit Literature for many more centuries to come. \r\n\t\t\tThus, it helps in transmitting its abundant knowledge it contains to the future generations.</p>\r\n\t\t<p>Samsaadhani, a Sanskrit computational tool-kit is an e-platform for understanding Sanskrit texts \r\n\t\t\tfollowing the Indian grammatical tradition of Vyākaraṇa, Nyāya, and Mīmāṃsā. Use of this tool-kit\r\n\t\t\t will facilitate the poetic usability for a linguist and also for a learner. With the help of this kit, \r\n\t\t\t an e-reader of Śiśupālavadha of Māgha (Pūrvārdha) is developed through computational linguistic approach,\r\n\t\t\t  which serves the purpose of research, learning and also a tool of pedagogy.</p>\r\n\t\t<p>Śiśupālavadha of Māgha occupies a prominent role among the Kāvyas of Bṛhattrayī and Pañcachamahākāvyas of \r\n\t\t\tSanskrit literature. So, it would be essential for any ardent Sanskrit learner to read and understand \r\n\t\t\tthis work.</p>\r\n\t\t<p>One can understand a Sanskrit verse in the following steps-</p>\r\n\t\t<ul>\r\n\t\t\t\t<li>(i) Padavibhāga </li>\r\n\t\t\t\t<li>(ii) Anvaya </li>\r\n\t\t\t\t<li>(iii) Word analysis </li>\r\n\t\t\t\t<li>(iv) Syntactical relation</li>\r\n\t\t\t\t <li>(v) Grammatical function</li>\r\n\t\t</ul>\r\n\t\t<p>The existing tools of Samsaadhani are used for generating the output of the features mentioned above of a verse. These tools show up all possible tags. Apart from these, information on (i) Alaṅkāra (ii) Vṛttam* (iii) Hindi translation, and (iv) English translation is given manually to every verse. And also, a hyperlink to dictionaries, and Amarakośa are given. A pop-up feature on Vyākaraṇa aspects from Mallinātha's commentary is also added. The chronological index of Ślokas is given along with a search option.</p>\r\n\t\t<p>Thus, with the help of this tool-kit, an interested reader can have a complete analysis of any verse of Śiśupālavadha of Māgha (Pūrvārdha) at various levels.</p>\r\n\t\t<p>Mallinātha's Sarvaṅkaṣā commentary and Chowkāmbha Publications are taken as reliable sources for review and translation. For English translation Cantos I-IV are taken from Chowkhamba Krishnadas Academy and Cantos VI-X are translated by Dr. Ryali Anupama.</p>\r\n\t\t<p>Thus this work with Hindi and English translation is available in e-version which allows a reader to navigate through all the steps as mentioned above and understand the text in a better way.</p>\r\n\t\t<p>* In canto-II, information of chandas instead of Vṛttam is given.</p>\r\n    </div>\r\n</div>"

/***/ }),

/***/ 485:
/***/ (function(module, exports) {

module.exports = "<div class=\"col-md-12 helpBar row\">\r\n\r\n    <div class=\"col-md-2\">\r\n        <div class=\"n1 help\"></div>\r\n        <div style=\"width: auto; font-size: 14px;\">प्रथमा विभक्तिः</div>\r\n    </div>\r\n    <div class=\"col-md-2\">\r\n        <div class=\"n2 help\"></div>\r\n        <div style=\"width: auto; font-size: 14px;\">द्वितीया विभक्तिः </div>\r\n    </div>\r\n\r\n    <div class=\"col-md-2\">\r\n        <div class=\"n3 help\"></div>\r\n        <div style=\"width: auto; font-size: 14px;\">तृतीया विभक्तिः</div>\r\n    </div>\r\n    <div class=\"col-md-2\">\r\n        <div class=\"n4 help\"></div>\r\n        <div style=\"width: auto; font-size: 14px;\">चतुर्थी विभक्तिः </div>\r\n    </div>\r\n    <div class=\"col-md-2\">\r\n        <div class=\"n5 help\"></div>\r\n        <div style=\"width: auto; font-size: 14px;\">पञ्चमी विभक्तिः </div>\r\n    </div>\r\n    <div class=\"col-md-2\">\r\n        <div class=\"n6 help\"></div>\r\n        <div style=\"width: auto; font-size: 14px;\"> षष्ठी विभक्तिः</div>\r\n    </div>\r\n\r\n\r\n\r\n    <div class=\"col-md-2\">\r\n        <div class=\"n7 help\"></div>\r\n        <div style=\"width: auto; font-size: 14px;\">सप्तमी विभक्तिः</div>\r\n    </div>\r\n    <div class=\"col-md-2\">\r\n        <div class=\"v help\"></div>\r\n        <div style=\"width: auto; font-size: 14px;\">verb</div>\r\n    </div>\r\n\r\n    <div class=\"col-md-3\">\r\n        <div class=\"n8 help\"></div>\r\n        <div style=\"width: auto; font-size: 14px;\">सम्बोधना प्रथमा विभक्तिः</div>\r\n    </div>\r\n    <div class=\"col-md-2\">\r\n        <div class=\"NA help\"></div>\r\n        <div style=\"width: auto; font-size: 14px;\">NA</div>\r\n    </div>\r\n</div>\r\n\r\n<div class=\"row\">\r\n    <div class=\"col-md-12 row\">\r\n        <div class=\"col-md-2\">\r\n            <fieldset class=\"form-group\">\r\n                <input type=\"checkbox\" id=\"checkbox3\" [checked]=\"row1\" (change)=\"showRow($event.target.checked,'row1')\">\r\n                <label for=\"checkbox3\" class=\"disabled\">पदविभाग (A)</label>\r\n            </fieldset>\r\n        </div>\r\n        <div class=\"col-md-2\">\r\n            <fieldset class=\"form-group\">\r\n                <input type=\"checkbox\" class=\"filled-in\" id=\"checkbox4\" [checked]=\"row2\" (change)=\"showRow($event.target.checked,'row2')\">\r\n                <label for=\"checkbox4\" class=\"disabled\">संस्कृतम् (B)</label>\r\n            </fieldset>\r\n        </div>\r\n\r\n        <div class=\"col-md-2\">\r\n            <fieldset class=\"form-group\">\r\n                <input type=\"checkbox\" id=\"checkbox3\" [checked]=\"row3\" (change)=\"showRow($event.target.checked,'row3')\">\r\n                <label for=\"checkbox3\" class=\"disabled\">विभक्तिः (C)</label>\r\n            </fieldset>\r\n        </div>\r\n        <div class=\"col-md-2\">\r\n            <fieldset class=\"form-group\">\r\n                <input type=\"checkbox\" class=\"filled-in\" id=\"checkbox4\" [checked]=\"row4\" (change)=\"showRow($event.target.checked,'row4')\">\r\n                <label for=\"checkbox4\" class=\"disabled\">शब्दविश्लेषणम् (D)</label>\r\n            </fieldset>\r\n        </div>\r\n        <div class=\"col-md-2\">\r\n            <fieldset class=\"form-group\">\r\n                <input type=\"checkbox\" id=\"checkbox3\" [checked]=\"row5\" (change)=\"showRow($event.target.checked,'row5')\">\r\n                <label for=\"checkbox3\" class=\"disabled\">हिन्दी-विभक्तिः (E)</label>\r\n            </fieldset>\r\n        </div>\r\n        <div class=\"col-md-2\">\r\n            <fieldset class=\"form-group\">\r\n                <input type=\"checkbox\" class=\"filled-in\" id=\"checkbox4\" [checked]=\"row6\" (change)=\"showRow($event.target.checked,'row6')\">\r\n                <label for=\"checkbox4\" class=\"disabled\">हिन्दी अर्थ(F)</label>\r\n            </fieldset>\r\n        </div>\r\n        <div class=\"col-md-2\">\r\n            <fieldset class=\"form-group\">\r\n                <input type=\"checkbox\" id=\"checkbox3\" [checked]=\"row7\" (change)=\"showRow($event.target.checked,'row7')\">\r\n                <label for=\"checkbox3\" class=\"disabled\">Meaning(G)</label>\r\n            </fieldset>\r\n        </div>\r\n        <div class=\"col-md-2\">\r\n            <!--  <md-checkbox class=\"example-margin\" [checked]=\"row8\" (change)=\"showRow($event.target.checked,'row8')\">Samasa(H)</md-checkbox> -->\r\n\r\n            <fieldset class=\"form-group\">\r\n                <input type=\"checkbox\" class=\"filled-in\" id=\"checkbox4\" [checked]=\"row8\" (change)=\"showRow($event.target.checked,'row8')\">\r\n                <label for=\"checkbox4\" class=\"disabled\">समास(H)</label>\r\n            </fieldset>\r\n        </div>\r\n\t\t<!-- <div class=\"col-md-2\">\r\n            <fieldset class=\"form-group\">\r\n                <input type=\"checkbox\" class=\"filled-in\" id=\"checkbox4\" [checked]=\"row9\" (change)=\"showRow($event.target.checked,'row9')\">\r\n                <label for=\"checkbox4\" class=\"disabled\">prayoga (I)</label>\r\n            </fieldset> \r\n        </div> -->\r\n    </div>\r\n    \r\n    <div class=\"col-md-12\">\r\n    \r\n        <code> Note: Mouse over/Click on blue color text to view Vyakarana/Samasa/Dictionaries/graphical repersentation of Karaka  </code>\r\n    <br/>\r\n    </div>\r\n    \r\n    <div class=\"col-md-12\">\r\n        <div *ngIf=\"slokaTranslation\" class=\"col-md-12\">\r\n\r\n            <table *ngFor=\"let table of slokaTranslation\" class=\"table\">\r\n                <tr *ngFor=\"let row of table.trRows\">\r\n                    <td *ngFor=\"let td of row.tdColumns; let i = index\" class=\"{{td.className}}\"  [ngClass]=\"{'tool-tip': td.tooltipText != null }\" [hidden]=\"show(td.row)\" ngbTooltip=\"{{ td.tooltipText != null ? td.tooltipText : '' }}\">\r\n\t\t\t\t\t\t<span *ngIf=\"td.row === 'row4' && td.className !== 'number' \"> <app-dict-view [name]=\"td.data\" ></app-dict-view> </span>\r\n\t\t\t\t\t\t<span *ngIf=\"td.row === 'row4' && td.className === 'number' \" [innerHTML]=\"td.data\"> </span>\r\n\t\t\t\t\t\t<span *ngIf=\"td.row !== 'row4'\">   \r\n                        <span *ngIf=\"td.tooltipImage\" [innerHTML]=\"td.data\" (click)=\"mouseEnter(td.tooltipImage,content)\" ></span>\r\n                        <span *ngIf=\"!td.tooltipImage\" [innerHTML]=\"td.data\"></span>\r\n\t\t\t\t\t\t</span>\r\n                    </td>\r\n                </tr>\r\n            </table>\r\n        </div>\t\r\n    </div>\r\n\t\r\n\t<div class=\"virttam\">\r\n\t\t\t<div> वृत्तम्/छन्दस् :  {{ vrittam }} </div>  <div> अलङ्कार :  {{ alankara }} </div>\r\n\t</div>\r\n</div>\r\n\r\n\r\n\r\n<ng-template #content let-c=\"close\" let-d=\"dismiss\">\r\n    <div class=\"modal-header\">\r\n        <button type=\"button\" class=\"close\" aria-label=\"Close\" (click)=\"d('Cross click')\">\r\n            <span aria-hidden=\"true\">&times;</span>\r\n        </button>\r\n    </div>\r\n    <div class=\"modal-body\">\r\n        <img src=\"assets/{{showImagePath}}\" class=\"img-fluid mx-auto d-block\">\r\n    </div>\r\n</ng-template>"

/***/ }),

/***/ 486:
/***/ (function(module, exports) {

module.exports = "<div class=\"col-md-12\">\r\n    <ol class=\"breadcrumb\">\r\n        <li class=\"breadcrumb-item\"> <a routerLink=\"/home\" routerLinkActive=\"true\">Home</a></li>\r\n        <li class=\"breadcrumb-item\"> <a routerLink=\"/canto\" routerLinkActive=\"true\">Cantos</a></li>\r\n        <li class=\"breadcrumb-item active\">{{cantoInfo}}</li>\r\n    </ol>\r\n\t\r\n</div>\r\n\r\n<div class='col-md-12'>\r\n\r\n    <div class=\"col-md-12 row\" *ngIf=\"loading\">\r\n        ... Loading\r\n    </div>\r\n\r\n    <div class=\"col-md-12 row\" *ngIf=\"!loading\">\r\n\t\r\n        <div class=\"col-md-3\" *ngIf=\"index\">\r\n\t\t\t<div> <input type=\"text\" class=\"form-control\" [(ngModel)]=\"slokaTerm\" placeholder=\"Search\"/> </div>\r\n            <ul class=\"items\">\r\n\t\t\t\t\r\n                <li (click)=\"showAll()\" class=\"text-center chip\" [class.selected]=\"isSelected(0)\"> All </li>\r\n                <li *ngFor=\"let item of index | filter: slokaTerm \" (click)=\"selectSloka(item)\" [class.selected]=\"isSelected(item) \" class=\"chip\" ngbTooltip=\"Click for {{item.slokaNo}} sloka \"> <span class=\"badge\">{{item.slokaNo}} </span> {{item.sloka}}</li>\r\n            </ul>\r\n\r\n        </div>\r\n\r\n        <div class=\"col-md-9\" *ngIf=\"canto\">\r\n\r\n            <ul class=\"list-group list\">\r\n                <li class=\"list-group-item animated fadeInUp chip\" *ngFor=\"let sloka of canto | filter : slokaTerm\"  id=\"{{sloka.slokaNo}}\">\r\n                    <div  *ngIf=\"!sloka.show\"  (click)=\"showView(sloka)\" ngbTooltip=\"Click to view Translation\" container=\"body\" class=\"link\">\r\n                       <span class=\"badge badge-default\">{{sloka.slokaNo}} </span>{{sloka.sloka}} \r\n                    </div>\r\n                    <div *ngIf=\"sloka.show\" (click)=\"showView(sloka)\" class=\" animated fadeIn\" ngbTooltip=\"Click to Hide\" container=\"body\">\r\n                        <div>\r\n\r\n                            <div class=\"card-block\">\r\n\r\n                                <h5 class=\"card-title\"> <span class=\"badge badge-default\">{{ sloka.slokaNo}}</span> {{sloka.sloka}}</h5>\r\n                                <h6 class=\"card-subtitle mb-2 text-primary\">{{sloka.pada}}</h6>\r\n                                <p class=\"card-text text-muted\">{{sloka.padaInfo}}</p>\r\n                                <h6 class=\"card-subtitle mb-2 text-danger\">{{sloka.anvaya}}</h6>\r\n                                <p class=\"card-text text-muted\"> {{sloka.anvayaInfo}}</p>\r\n                                <h6 class=\"card-subtitle mb-2 text-warning\">{{sloka.hindi}}</h6>\r\n                                <p class=\"card-text text-muted\"> {{sloka.hindiInfo}}</p>\r\n                                <h6 class=\"card-subtitle mb-2 text-info\">{{sloka.english}}</h6>\r\n                                <p class=\"card-text text-muted\"> {{sloka.englishInfo}}</p>\r\n\r\n                            </div>\r\n                        </div>\r\n\r\n                    </div>\r\n                    <div class=\"col-md-12 animated fadeIn\" *ngIf=\"sloka.show\">\r\n                        <sloka-detail-view [vrittam]=\"getAdditionalInfo(sloka.slokaNo,'10')\" [alankara]=\"getAdditionalInfo(sloka.slokaNo,'11')\" [title]='sloka.sloka' [slokaTranslation]='getSlokaTranslation(sloka.slokaNo)'>\r\n\t\t\t\t\t\t</sloka-detail-view>\r\n                    </div>\r\n\r\n                </li>\r\n            </ul>\r\n\r\n        </div>\r\n    </div>\r\n\r\n</div>"

/***/ }),

/***/ 487:
/***/ (function(module, exports) {

module.exports = "<div class=\"col-md-12\">\r\n    <ol class=\"breadcrumb\">\r\n        <li class=\"breadcrumb-item \"> <a routerLink=\"/home\" routerLinkActive=\"true\">Home</a></li>\r\n        <li class=\"breadcrumb-item active \"> Cantos</li>\r\n    </ol>\r\n\r\n\t<div class=\"col-md-12\">\r\n\t\r\n\t</div>\r\n    <div class=\"col-md-12 row\">\r\n        <!-- <div class=\"col-md-2\" *ngFor=\" let sloka of slokas \" (click)=\"onSelect(sloka) \"> <span class=\"badge badge-default rounded-circle\">{{ sloka.id}}</span> {{sloka.name}}</div> -->\r\n\r\n        <div class=\"items col-md-3 text-center \" *ngFor=\"let sloka of slokas\" (click)=\"onSelect(sloka) \" [class.selected]=\"isSelected(sloka)\"  [class.hide]=\"!isSelected(sloka)\" ngbTooltip=\"Click to view the Canto \" >\r\n\r\n            <li class=\"chip animated fadeInLeft \"> \r\n                {{sloka.name}} <br/>\r\n                Canto {{sloka.id}}\r\n            </li>\r\n            \r\n\r\n        </div>\r\n\r\n    </div>\r\n\r\n</div>"

/***/ }),

/***/ 488:
/***/ (function(module, exports) {

module.exports = "<div class=\"col-md-12\">\r\n    <ol class=\"breadcrumb\">\r\n        <li class=\"breadcrumb-item\"> <a routerLink=\"/home\" routerLinkActive=\"true\">Home</a></li>\r\n        <li class=\"breadcrumb-item active\">Source - MAHĀBHĀRATA – THE SOURCE EPIC</li>\r\n    </ol>\r\n\r\n\r\n\r\n    <div class=\"panel\">\r\n\r\n        <p>Śiśupālavadha of Māgha is an extract of 33rd to 45th chapters of sabhāparva of Srīmad Mahābhārata. In Śiśupālavadha of Māgha, the poet, follows, in the main, the story of the Mahābhārata, but the simple story of the epic is by his poetic touch lifted into the region of true poetry and turned into a highly finished poem. The descriptions and most of the situations are all of his own and they owe very little to the original. Below are the extracts of slokas of Śrīmad Mahābhārata that contain the content of Śiśupālavadha.\r\n\r\n        </p>\r\n\r\n    </div>\r\n\r\n\r\n    <div class=\"row\">\r\n\r\n\r\n        <div class=\"col-md-3\">\r\n\r\n            <ul class=\"items text-center\">\r\n                <li (click)=\"showMPSP(33)\" [ngClass]=\"{'selected':mpsp == 33 }\">अध्याय-33</li>\r\n                <li (click)=\"showMPSP(34)\" [ngClass]=\"{'selected':mpsp == 34 }\">अध्याय-34</li>\r\n                <li (click)=\"showMPSP(35)\" [ngClass]=\"{'selected':mpsp == 35 }\">अध्याय-35</li>\r\n                <li (click)=\"showMPSP(36)\" [ngClass]=\"{'selected':mpsp == 36 }\">अध्याय-36</li>\r\n                <li (click)=\"showMPSP(37)\" [ngClass]=\"{'selected':mpsp == 37 }\">अध्याय-37</li>\r\n                <li (click)=\"showMPSP(38)\" [ngClass]=\"{'selected':mpsp == 38 }\">अध्याय-38</li>\r\n                <li (click)=\"showMPSP(39)\" [ngClass]=\"{'selected':mpsp == 39 }\">अध्याय-39</li>\r\n                <li (click)=\"showMPSP(40)\" [ngClass]=\"{'selected':mpsp == 40 }\">अध्याय-40</li>\r\n                <li (click)=\"showMPSP(41)\" [ngClass]=\"{'selected':mpsp == 41 }\">अध्याय-41</li>\r\n                <li (click)=\"showMPSP(42)\" [ngClass]=\"{'selected':mpsp == 42 }\">अध्याय-42</li>\r\n                <li (click)=\"showMPSP(43)\" [ngClass]=\"{'selected':mpsp == 43 }\">अध्याय-43</li>\r\n                <li (click)=\"showMPSP(44)\" [ngClass]=\"{'selected':mpsp == 44 }\">अध्याय-44</li>\r\n                <li (click)=\"showMPSP(45)\" [ngClass]=\"{'selected':mpsp == 45 }\">अध्याय-45</li>\r\n            </ul>\r\n\r\n        </div>\r\n\r\n\r\n        <div class=\"col-md-9\">\r\n\r\n            <div *ngIf=\"mpsp == 33\">\r\n\r\n                <embed src=\"assets/html/mb/MB-SP-33.pdf\" width=\"100%\" height=\"700\" type='application/pdf'>\r\n\r\n            </div>\r\n            <div *ngIf=\"mpsp == 34\">\r\n\r\n                <embed src=\"assets/html/mb/MB-SP-34.pdf\" width=\"100%\" height=\"700\" type='application/pdf'>\r\n\r\n            </div>\r\n\r\n            <div *ngIf=\"mpsp == 35\">\r\n\r\n                <embed src=\"assets/html/mb/MB-SP-35.pdf\" width=\"100%\" height=\"700\" type='application/pdf'>\r\n\r\n            </div>\r\n            <div *ngIf=\"mpsp == 36\">\r\n\r\n                <embed src=\"assets/html/mb/MB-SP-36.pdf\" width=\"100%\" height=\"700\" type='application/pdf'>\r\n\r\n            </div>\r\n            <div *ngIf=\"mpsp == 37\">\r\n\r\n                <embed src=\"assets/html/mb/MB-SP-37.pdf\" width=\"100%\" height=\"700\" type='application/pdf'>\r\n\r\n            </div>\r\n            <div *ngIf=\"mpsp == 38\">\r\n\r\n                <embed src=\"assets/html/mb/MB-SP-38.pdf\" width=\"100%\" height=\"700\" type='application/pdf'>\r\n\r\n            </div>\r\n            <div *ngIf=\"mpsp == 39\">\r\n\r\n                <embed src=\"assets/html/mb/MB-SP-39.pdf\" width=\"100%\" height=\"700\" type='application/pdf'>\r\n\r\n            </div>\r\n            <div *ngIf=\"mpsp == 40\">\r\n\r\n                <embed src=\"assets/html/mb/MB-SP-40.pdf\" width=\"100%\" height=\"700\" type='application/pdf'>\r\n\r\n            </div>\r\n            <div *ngIf=\"mpsp == 41\">\r\n\r\n                <embed src=\"assets/html/mb/MB-SP-41.pdf\" width=\"100%\" height=\"700\" type='application/pdf'>\r\n\r\n            </div>\r\n            <div *ngIf=\"mpsp == 42\">\r\n\r\n                <embed src=\"assets/html/mb/MB-SP-42.pdf\" width=\"100%\" height=\"700\" type='application/pdf'>\r\n\r\n            </div>\r\n            <div *ngIf=\"mpsp == 43\">\r\n\r\n                <embed src=\"assets/html/mb/MB-SP-43.pdf\" width=\"100%\" height=\"700\" type='application/pdf'>\r\n\r\n            </div>\r\n            <div *ngIf=\"mpsp == 44\">\r\n\r\n                <embed src=\"assets/html/mb/MB-SP-44.pdf\" width=\"100%\" height=\"700\" type='application/pdf'>\r\n\r\n            </div>\r\n            <div *ngIf=\"mpsp == 45\">\r\n\r\n                <embed src=\"assets/html/mb/MB-SP-45.pdf\" width=\"100%\" height=\"700\" type='application/pdf'>\r\n\r\n            </div>\r\n\r\n\r\n        </div>\r\n\r\n\r\n    </div>\r\n\r\n\r\n\r\n\r\n\r\n\r\n</div>"

/***/ }),

/***/ 489:
/***/ (function(module, exports) {

module.exports = "<div class=\"col-md-12\">\r\n    <ol class=\"breadcrumb\">\r\n        <li class=\"breadcrumb-item\"> <a routerLink=\"/home\" routerLinkActive=\"true\">Home</a></li>\r\n        <li class=\"breadcrumb-item active\">Summary</li>\r\n    </ol>\r\n    <div class=\"row\">\r\n        <div class=\"col-md-3\" *ngIf=\"data\">\r\n            <ul class=\"items\">\r\n                <li *ngFor=\"let item of data\" class=\"chip text-center\" (click)=\"onSelect(item)\" [class.selected]=\"selected == item.name \"> {{item.name}}</li>\r\n            </ul>\r\n        </div>\r\n        <div class=\"col-md-9\">\r\n            <div *ngFor=\"let item of data\">\r\n                <div *ngIf=\"selected == item.name\" class=\"card\">\r\n                    <ngb-tabset>\r\n                        <ngb-tab *ngFor=\"let obj of item.summaryList\" title={{obj.title}}>\r\n                            <ng-template ngbTabContent>\r\n                                <div [innerHTML]=\"obj.desc\"></div>\r\n                            </ng-template>\r\n                        </ngb-tab>\r\n                    </ngb-tabset>\r\n                </div>\r\n            </div>\r\n        </div>\r\n    </div>\r\n</div>"

/***/ }),

/***/ 739:
/***/ (function(module, exports, __webpack_require__) {

module.exports = __webpack_require__(281);


/***/ }),

/***/ 74:
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_0__angular_core__ = __webpack_require__(1);
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_1__angular_http__ = __webpack_require__(72);
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_2_rxjs_Observable__ = __webpack_require__(0);
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_2_rxjs_Observable___default = __webpack_require__.n(__WEBPACK_IMPORTED_MODULE_2_rxjs_Observable__);
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_3_rxjs_add_operator_catch__ = __webpack_require__(86);
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_3_rxjs_add_operator_catch___default = __webpack_require__.n(__WEBPACK_IMPORTED_MODULE_3_rxjs_add_operator_catch__);
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_4_rxjs_add_operator_map__ = __webpack_require__(87);
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_4_rxjs_add_operator_map___default = __webpack_require__.n(__WEBPACK_IMPORTED_MODULE_4_rxjs_add_operator_map__);
/* unused harmony export SlokaDetails */
/* unused harmony export Sloka */
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "a", function() { return SlokaService; });
var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
var __metadata = (this && this.__metadata) || function (k, v) {
    if (typeof Reflect === "object" && typeof Reflect.metadata === "function") return Reflect.metadata(k, v);
};





var SlokaDetails = (function () {
    function SlokaDetails(id, sanskrit, hindi, english, templateUrl) {
        this.id = id;
        this.sanskrit = sanskrit;
        this.hindi = hindi;
        this.english = english;
        this.templateUrl = templateUrl;
    }
    return SlokaDetails;
}());

var Sloka = (function () {
    function Sloka(id, name, enabled, slokaDetails) {
        this.id = id;
        this.name = name;
        this.enabled = enabled;
        this.slokaDetails = slokaDetails;
    }
    return Sloka;
}());

var SLOKADetails = [
    new SlokaDetails(1, 'asdlkfasd', ';laksdjfas', 'asdfasdf', 'app/html/SV-1/sv-1.html'),
    new SlokaDetails(1, 'asdlkfasd', ';laksdjfas', 'asdfasdf', 'app/html/SV-1/sv-1.html'),
    new SlokaDetails(1, 'asdlkfasd', ';laksdjfas', 'asdfasdf', 'app/html/SV-1/sv-1.html'),
    new SlokaDetails(1, 'asdlkfasd', ';laksdjfas', 'asdfasdf', 'app/html/SV-1/sv-1.html'),
    new SlokaDetails(1, 'asdlkfasd', ';laksdjfas', 'asdfasdf', 'app/html/SV-1/sv-1.html'),
    new SlokaDetails(1, 'asdlkfasd', ';laksdjfas', 'asdfasdf', 'app/html/SV-1/sv-1.html'),
    new SlokaDetails(1, 'asdlkfasd', ';laksdjfas', 'asdfasdf', 'app/html/SV-1/sv-1.html'),
    new SlokaDetails(1, 'asdlkfasd', ';laksdjfas', 'asdfasdf', 'app/html/SV-1/sv-1.html')
];
var SLOKAS = [
    new Sloka(1, 'कृष्णनारदसम्भाषणम्', true, SLOKADetails),
    new Sloka(2, 'मन्त्रवर्णनम्', true, SLOKADetails),
    new Sloka(3, 'पुरीप्रस्थानम्', true, SLOKADetails),
    new Sloka(4, 'रैवतकवर्णनम्', true, SLOKADetails),
    new Sloka(5, 'सेनानिवेशः', true, SLOKADetails),
    new Sloka(6, 'ऋतुवर्णनम्', true, SLOKADetails),
    new Sloka(7, 'वनविहारः', true, SLOKADetails),
    new Sloka(8, 'जलविहारवर्णनम्', true, SLOKADetails),
    new Sloka(9, 'प्रदोषवर्णनम्', true, SLOKADetails),
    new Sloka(10, 'सुरतवर्णनम्', true, SLOKADetails),
    new Sloka(11, 'Canto', false, SLOKADetails),
    new Sloka(12, 'Canto', false, SLOKADetails),
    new Sloka(13, 'Canto', false, SLOKADetails),
    new Sloka(14, 'Canto', false, SLOKADetails),
    new Sloka(15, 'Canto', false, SLOKADetails),
    new Sloka(16, 'Canto', false, SLOKADetails),
    new Sloka(17, 'Canto', false, SLOKADetails),
    new Sloka(18, 'Canto', false, SLOKADetails),
    new Sloka(19, 'Canto', false, SLOKADetails),
    new Sloka(20, 'Canto', false, SLOKADetails)
];
var slokasPromise = Promise.resolve(SLOKAS);
var SlokaService = (function () {
    function SlokaService(http) {
        this.http = http;
        this.cantoUrl = 'assets/json/canto';
        this.indexUrl = 'assets/json/index';
        this.summaryUrl = 'assets/json/text.json';
        this.tanslationUrl = 'assets/json/SV-';
        this.dictUrl = 'assets/dicturl.json';
    }
    SlokaService.prototype.getDictUrl = function () {
        return this.http.get(this.dictUrl)
            .map(this.getJsonData)
            .catch(this.handleError);
    };
    SlokaService.prototype.getJsonData = function (res) {
        return res.json() || {};
    };
    SlokaService.prototype.getSlokas = function () { return SLOKAS; };
    ;
    SlokaService.prototype.getCantoList = function () {
        return this.cantoList;
    };
    SlokaService.prototype.setCantoList = function (list) {
        this.cantoList = list;
    };
    SlokaService.prototype.getSlokaDetails = function (id) {
        return slokasPromise.then(function (slokas) { return slokas.find(function (sloka) { return sloka.id === +id; }); });
    };
    SlokaService.prototype.getSummary = function () {
        return this.http.get(this.summaryUrl)
            .map(this.extractData)
            .catch(this.handleError);
    };
    SlokaService.prototype.getCantoData = function (num) {
        var url = this.cantoUrl + num + ".json";
        return this.http.get(url)
            .map(this.extractData)
            .catch(this.handleError);
    };
    SlokaService.prototype.getCangoIndex = function (num) {
        var url = this.indexUrl + num + ".json";
        return this.http.get(url)
            .map(this.extractData)
            .catch(this.handleError);
    };
    SlokaService.prototype.getSelectedSloka = function (sloka) {
        //console.log(this.cantoList);
        // console.log(this.cantoList[sloka.slokaNo]);
        //console.log(sloka);
    };
    // getTranslation details 
    SlokaService.prototype.getSlokaTranslation = function (num) {
        var url = this.tanslationUrl + num + ".json";
        return this.http.get(url)
            .map(this.extractData)
            .catch(this.handleError);
    };
    SlokaService.prototype.extractData = function (res) {
        var body = res.json();
        //this.cantoList = body;
        return body || {};
    };
    SlokaService.prototype.handleError = function (error) {
        return __WEBPACK_IMPORTED_MODULE_2_rxjs_Observable__["Observable"].throw("error");
    };
    return SlokaService;
}());
SlokaService = __decorate([
    __webpack_require__.i(__WEBPACK_IMPORTED_MODULE_0__angular_core__["Injectable"])(),
    __metadata("design:paramtypes", [typeof (_a = typeof __WEBPACK_IMPORTED_MODULE_1__angular_http__["c" /* Http */] !== "undefined" && __WEBPACK_IMPORTED_MODULE_1__angular_http__["c" /* Http */]) === "function" && _a || Object])
], SlokaService);

var _a;
//# sourceMappingURL=E:/Anupama/new-interface/sisupal/src/sloka-service.service.js.map

/***/ })

},[739]);
//# sourceMappingURL=main.bundle.map