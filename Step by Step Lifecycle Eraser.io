//Paste this into eraser.io to generate the diagram
title Laravel HTTP Request Lifecycle

// Entry Point
HTTP Request [shape: oval, color: lightblue, icon: globe]
Index PHP [color: blue, icon: file-text]
Autoload Composer [icon: package, color: blue]
Bootstrap App [icon: settings, color: blue]
Register Service Providers [icon: layers, color: blue]
Boot Service Providers [icon: play, color: blue]

// HTTP Kernel & Middleware
HTTP Kernel [icon: server, color: orange]
Register Middleware [icon: shield, color: orange]
Global Middleware Stack [icon: layers, color: orange]
Handle Request [icon: arrow-right, color: orange]

// Routing
Route Matching [icon: map, color: purple]
Route Found? [shape: diamond, color: purple, icon: search]
Route Middleware Stack [icon: filter, color: purple]

// Controller & Business Logic
Controller Resolution [icon: user, color: green]
Controller Method Exists? [shape: diamond, color: green, icon: check-square]
Invoke Controller Method [icon: play-circle, color: green]
Run Business Logic [icon: code, color: green]

// Response Handling
Generate Response [icon: send, color: teal]
Send Response [shape: oval, color: lightgreen, icon: send]

// Termination
Terminate Middleware [icon: stop-circle, color: red]
Terminate Kernel [icon: power, color: red]

// Relationships
HTTP Request > Index PHP
Index PHP > Autoload Composer
Autoload Composer > Bootstrap App
Bootstrap App > Register Service Providers
Register Service Providers > Boot Service Providers
Boot Service Providers > HTTP Kernel
HTTP Kernel > Register Middleware
Register Middleware > Global Middleware Stack
Global Middleware Stack > Handle Request
Handle Request > Route Matching
Route Matching > Route Found?
Route Found? > Route Middleware Stack: Yes
Route Found? > Generate Response: No (404)
Route Middleware Stack > Controller Resolution
Controller Resolution > Controller Method Exists?
Controller Method Exists? > Invoke Controller Method: Yes
Controller Method Exists? > Generate Response: No (404)
Invoke Controller Method > Run Business Logic
Run Business Logic > Generate Response
Generate Response > Send Response
Send Response > Terminate Middleware
Terminate Middleware > Terminate Kernel
