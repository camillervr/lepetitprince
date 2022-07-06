// Import and register all your controllers from the importmap under controllers/*

import { application } from "./application"

import HelloController from "./hello_controller.js"
application.register("hello", HelloController)
