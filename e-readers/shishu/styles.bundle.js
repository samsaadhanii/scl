webpackJsonp([2,4],{

/***/ 283:
/***/ (function(module, exports, __webpack_require__) {

// style-loader: Adds some css to the DOM by adding a <style> tag

// load the styles
var content = __webpack_require__(455);
if(typeof content === 'string') content = [[module.i, content, '']];
// add the styles to the DOM
var update = __webpack_require__(737)(content, {});
if(content.locals) module.exports = content.locals;
// Hot Module Replacement
if(false) {
	// When the styles change, update the <style> tags
	if(!content.locals) {
		module.hot.accept("!!../node_modules/css-loader/index.js?{\"sourceMap\":false}!../node_modules/postcss-loader/index.js!./styles.css", function() {
			var newContent = require("!!../node_modules/css-loader/index.js?{\"sourceMap\":false}!../node_modules/postcss-loader/index.js!./styles.css");
			if(typeof newContent === 'string') newContent = [[module.id, newContent, '']];
			update(newContent);
		});
	}
	// When the module is disposed, remove the <style> tags
	module.hot.dispose(function() { update(); });
}

/***/ }),

/***/ 455:
/***/ (function(module, exports, __webpack_require__) {

exports = module.exports = __webpack_require__(456)();
// imports


// module
exports.push([module.i, "/* You can add global styles to this file, and also import other style files */\r\n\r\n/*@import '~@angular/material/core/theming/prebuilt/deeppurple-amber.css'; */\r\n.items {\r\n    margin: 0 0 2em 0;\r\n    list-style-type: none;\r\n    padding: 0;\r\n}\r\n\r\n.items li {\r\n    cursor: pointer; \r\n    position: relative;\r\n    left: 0;\r\n    background-color: #EEE;\r\n    margin: .5em;\r\n    padding: .3em 0;\r\n    border-radius: 4px;\r\n}\r\n\r\n.items li:hover {\r\n    color: #607D8B;\r\n    background-color: #DDD;\r\n    left: .1em;\r\n}\r\n\r\n.items li.selected {\r\n    background-color: #607D8B;\r\n    /*#CFD8DC; */\r\n    color: white;\r\n}\r\n\r\n.items li.selected:hover {\r\n    background-color: #BBD8DC;\r\n}\r\n\r\n.items .text {\r\n    position: relative;\r\n    top: -3px;\r\n}\r\n\r\n.items .badge {\r\n    display: inline-block;\r\n    font-size: small;\r\n    color: white;\r\n    background-color: #607D8B;\r\n    position: relative;\r\n    left: -1px;\r\n    top: -2px;\r\n    margin-right: .8em;\r\n    border-radius: 4px 0 0 4px;\r\n    width: 2.2em;\r\n    height: 2em;\r\n}\r\n\r\n.bg-inverse {\r\n    background-color: #1fa67a !important;\r\n}\r\n\r\nbody,\r\nhtml {\r\n    font-family: Calibri, 'monaco,arial';\r\n    -webkit-font-smoothing: antialiased;\r\n}\r\n\r\n\r\n/* Sticky footer styles\r\n-------------------------------------------------- */\r\n\r\nhtml {\r\n    position: relative;\r\n    min-height: 100%;\r\n    font-family: 'calibri', 'Monaco', 'Monospace' !important;\r\n}\r\n\r\nbody {\r\n    /* Margin bottom by footer height */\r\n    margin-bottom: 60px;\r\n    font-family: 'calibri', 'Monaco', 'Monospace' !important;\r\n}\r\n\r\n.footer {\r\n    position: absolute;\r\n    bottom: 0;\r\n    width: 100%;\r\n    /* Set the fixed height of the footer here */\r\n    height: 60px;\r\n    background-color: #f5f5f5;\r\n}\r\n\r\n\r\n/* Custom page CSS\r\n-------------------------------------------------- */\r\n\r\n\r\n/* Not required for template or sticky footer method. */\r\n\r\nbody > container {}\r\n\r\n.container .text-muted {\r\n    margin: 20px 0;\r\n}\r\n\r\n.footer > .container {\r\n    padding-right: 15px;\r\n    padding-left: 15px;\r\n}\r\n\r\ncode {\r\n    font-size: 80%;\r\n}\r\n\r\n.intro-text {\r\n    display: table;\r\n    height: auto;\r\n    padding: 100px 10px;\r\n    width: 100%;\r\n}\r\n\r\nmodal-dialog {\r\n    width: 100% !important;\r\n    margin: 30px auto;\r\n    max-width: 100% !important;\r\n}\r\n\r\n@media (min-width: 576px) .modal-dialog {\r\n    max-width: auto !important;\r\n    margin: 30px auto;\r\n}\r\n\r\n.tab-content {\r\n    padding: 2em !important;\r\n    text-align: justify;\r\n    font-family: 'calibri', 'Monaco', 'Monospace' !important;\r\n}\r\n\r\ntd span {\r\n\t/*padding:4px; */\r\n}\r\n\r\n.virttam {\r\n\tdisplay:-webkit-box;\r\n\tdisplay:-ms-flexbox;\r\n\tdisplay:flex;\r\n\t-webkit-box-orient:vertical;\r\n\t-webkit-box-direction:normal;\r\n\t    -ms-flex-direction:column;\r\n\t        flex-direction:column;\r\n\t-ms-flex-pack:distribute;\r\n\t    justify-content:space-around;\r\n\tfont-weight:bold;\r\n\tpadding:4px;\r\n}\r\n\r\n.sublist li a {\r\n\tcolor:blue !important;\r\n\ttext-decoration:underline !important;\r\n\tpadding:3px;\r\n}\r\n.tool-tip {\r\n\tcolor:blue !important;\r\n}\r\n\r\ntd span a {\r\n\tcolor:blue !important;\r\n}\r\ntd span a:hover {\r\n\tcolor:black !important;\r\n}\r\ninput[type=\"checkbox\"] {\r\n\tcursor:pointer;\r\n}", ""]);

// exports


/***/ }),

/***/ 456:
/***/ (function(module, exports) {

/*
	MIT License http://www.opensource.org/licenses/mit-license.php
	Author Tobias Koppers @sokra
*/
// css base code, injected by the css-loader
module.exports = function() {
	var list = [];

	// return the list of modules as css string
	list.toString = function toString() {
		var result = [];
		for(var i = 0; i < this.length; i++) {
			var item = this[i];
			if(item[2]) {
				result.push("@media " + item[2] + "{" + item[1] + "}");
			} else {
				result.push(item[1]);
			}
		}
		return result.join("");
	};

	// import a list of modules into the list
	list.i = function(modules, mediaQuery) {
		if(typeof modules === "string")
			modules = [[null, modules, ""]];
		var alreadyImportedModules = {};
		for(var i = 0; i < this.length; i++) {
			var id = this[i][0];
			if(typeof id === "number")
				alreadyImportedModules[id] = true;
		}
		for(i = 0; i < modules.length; i++) {
			var item = modules[i];
			// skip already imported module
			// this implementation is not 100% perfect for weird media query combinations
			//  when a module is imported multiple times with different media queries.
			//  I hope this will never occur (Hey this way we have smaller bundles)
			if(typeof item[0] !== "number" || !alreadyImportedModules[item[0]]) {
				if(mediaQuery && !item[2]) {
					item[2] = mediaQuery;
				} else if(mediaQuery) {
					item[2] = "(" + item[2] + ") and (" + mediaQuery + ")";
				}
				list.push(item);
			}
		}
	};
	return list;
};


/***/ }),

/***/ 737:
/***/ (function(module, exports) {

/*
	MIT License http://www.opensource.org/licenses/mit-license.php
	Author Tobias Koppers @sokra
*/
var stylesInDom = {},
	memoize = function(fn) {
		var memo;
		return function () {
			if (typeof memo === "undefined") memo = fn.apply(this, arguments);
			return memo;
		};
	},
	isOldIE = memoize(function() {
		return /msie [6-9]\b/.test(self.navigator.userAgent.toLowerCase());
	}),
	getHeadElement = memoize(function () {
		return document.head || document.getElementsByTagName("head")[0];
	}),
	singletonElement = null,
	singletonCounter = 0,
	styleElementsInsertedAtTop = [];

module.exports = function(list, options) {
	if(typeof DEBUG !== "undefined" && DEBUG) {
		if(typeof document !== "object") throw new Error("The style-loader cannot be used in a non-browser environment");
	}

	options = options || {};
	// Force single-tag solution on IE6-9, which has a hard limit on the # of <style>
	// tags it will allow on a page
	if (typeof options.singleton === "undefined") options.singleton = isOldIE();

	// By default, add <style> tags to the bottom of <head>.
	if (typeof options.insertAt === "undefined") options.insertAt = "bottom";

	var styles = listToStyles(list);
	addStylesToDom(styles, options);

	return function update(newList) {
		var mayRemove = [];
		for(var i = 0; i < styles.length; i++) {
			var item = styles[i];
			var domStyle = stylesInDom[item.id];
			domStyle.refs--;
			mayRemove.push(domStyle);
		}
		if(newList) {
			var newStyles = listToStyles(newList);
			addStylesToDom(newStyles, options);
		}
		for(var i = 0; i < mayRemove.length; i++) {
			var domStyle = mayRemove[i];
			if(domStyle.refs === 0) {
				for(var j = 0; j < domStyle.parts.length; j++)
					domStyle.parts[j]();
				delete stylesInDom[domStyle.id];
			}
		}
	};
}

function addStylesToDom(styles, options) {
	for(var i = 0; i < styles.length; i++) {
		var item = styles[i];
		var domStyle = stylesInDom[item.id];
		if(domStyle) {
			domStyle.refs++;
			for(var j = 0; j < domStyle.parts.length; j++) {
				domStyle.parts[j](item.parts[j]);
			}
			for(; j < item.parts.length; j++) {
				domStyle.parts.push(addStyle(item.parts[j], options));
			}
		} else {
			var parts = [];
			for(var j = 0; j < item.parts.length; j++) {
				parts.push(addStyle(item.parts[j], options));
			}
			stylesInDom[item.id] = {id: item.id, refs: 1, parts: parts};
		}
	}
}

function listToStyles(list) {
	var styles = [];
	var newStyles = {};
	for(var i = 0; i < list.length; i++) {
		var item = list[i];
		var id = item[0];
		var css = item[1];
		var media = item[2];
		var sourceMap = item[3];
		var part = {css: css, media: media, sourceMap: sourceMap};
		if(!newStyles[id])
			styles.push(newStyles[id] = {id: id, parts: [part]});
		else
			newStyles[id].parts.push(part);
	}
	return styles;
}

function insertStyleElement(options, styleElement) {
	var head = getHeadElement();
	var lastStyleElementInsertedAtTop = styleElementsInsertedAtTop[styleElementsInsertedAtTop.length - 1];
	if (options.insertAt === "top") {
		if(!lastStyleElementInsertedAtTop) {
			head.insertBefore(styleElement, head.firstChild);
		} else if(lastStyleElementInsertedAtTop.nextSibling) {
			head.insertBefore(styleElement, lastStyleElementInsertedAtTop.nextSibling);
		} else {
			head.appendChild(styleElement);
		}
		styleElementsInsertedAtTop.push(styleElement);
	} else if (options.insertAt === "bottom") {
		head.appendChild(styleElement);
	} else {
		throw new Error("Invalid value for parameter 'insertAt'. Must be 'top' or 'bottom'.");
	}
}

function removeStyleElement(styleElement) {
	styleElement.parentNode.removeChild(styleElement);
	var idx = styleElementsInsertedAtTop.indexOf(styleElement);
	if(idx >= 0) {
		styleElementsInsertedAtTop.splice(idx, 1);
	}
}

function createStyleElement(options) {
	var styleElement = document.createElement("style");
	styleElement.type = "text/css";
	insertStyleElement(options, styleElement);
	return styleElement;
}

function createLinkElement(options) {
	var linkElement = document.createElement("link");
	linkElement.rel = "stylesheet";
	insertStyleElement(options, linkElement);
	return linkElement;
}

function addStyle(obj, options) {
	var styleElement, update, remove;

	if (options.singleton) {
		var styleIndex = singletonCounter++;
		styleElement = singletonElement || (singletonElement = createStyleElement(options));
		update = applyToSingletonTag.bind(null, styleElement, styleIndex, false);
		remove = applyToSingletonTag.bind(null, styleElement, styleIndex, true);
	} else if(obj.sourceMap &&
		typeof URL === "function" &&
		typeof URL.createObjectURL === "function" &&
		typeof URL.revokeObjectURL === "function" &&
		typeof Blob === "function" &&
		typeof btoa === "function") {
		styleElement = createLinkElement(options);
		update = updateLink.bind(null, styleElement);
		remove = function() {
			removeStyleElement(styleElement);
			if(styleElement.href)
				URL.revokeObjectURL(styleElement.href);
		};
	} else {
		styleElement = createStyleElement(options);
		update = applyToTag.bind(null, styleElement);
		remove = function() {
			removeStyleElement(styleElement);
		};
	}

	update(obj);

	return function updateStyle(newObj) {
		if(newObj) {
			if(newObj.css === obj.css && newObj.media === obj.media && newObj.sourceMap === obj.sourceMap)
				return;
			update(obj = newObj);
		} else {
			remove();
		}
	};
}

var replaceText = (function () {
	var textStore = [];

	return function (index, replacement) {
		textStore[index] = replacement;
		return textStore.filter(Boolean).join('\n');
	};
})();

function applyToSingletonTag(styleElement, index, remove, obj) {
	var css = remove ? "" : obj.css;

	if (styleElement.styleSheet) {
		styleElement.styleSheet.cssText = replaceText(index, css);
	} else {
		var cssNode = document.createTextNode(css);
		var childNodes = styleElement.childNodes;
		if (childNodes[index]) styleElement.removeChild(childNodes[index]);
		if (childNodes.length) {
			styleElement.insertBefore(cssNode, childNodes[index]);
		} else {
			styleElement.appendChild(cssNode);
		}
	}
}

function applyToTag(styleElement, obj) {
	var css = obj.css;
	var media = obj.media;

	if(media) {
		styleElement.setAttribute("media", media)
	}

	if(styleElement.styleSheet) {
		styleElement.styleSheet.cssText = css;
	} else {
		while(styleElement.firstChild) {
			styleElement.removeChild(styleElement.firstChild);
		}
		styleElement.appendChild(document.createTextNode(css));
	}
}

function updateLink(linkElement, obj) {
	var css = obj.css;
	var sourceMap = obj.sourceMap;

	if(sourceMap) {
		// http://stackoverflow.com/a/26603875
		css += "\n/*# sourceMappingURL=data:application/json;base64," + btoa(unescape(encodeURIComponent(JSON.stringify(sourceMap)))) + " */";
	}

	var blob = new Blob([css], { type: "text/css" });

	var oldSrc = linkElement.href;

	linkElement.href = URL.createObjectURL(blob);

	if(oldSrc)
		URL.revokeObjectURL(oldSrc);
}


/***/ }),

/***/ 741:
/***/ (function(module, exports, __webpack_require__) {

module.exports = __webpack_require__(283);


/***/ })

},[741]);
//# sourceMappingURL=styles.bundle.map