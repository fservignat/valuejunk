// This file is auto-generated by ./bin/rails stimulus:manifest:update
// Run that command whenever you add a new controller or create them with
// ./bin/rails generate stimulus controllerName

import { application } from "./application"

import HelloController from "./hello_controller"
application.register("hello", HelloController)

import JunkCardController from "./junk_card_controller"
application.register("junk-card", JunkCardController)

import MapController from "./map_controller"
application.register("map", MapController)

import NavbarController from "./navbar_controller"
application.register("navbar", NavbarController)

import SearchFormController from "./search_form_controller"
application.register("search-form", SearchFormController)

import ServiceCardController from "./service_card_controller"
application.register("service-card", ServiceCardController)

import TypedJsController from "./typed_js_controller"
application.register("typed-js", TypedJsController)
