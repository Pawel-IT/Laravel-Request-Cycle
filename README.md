# Laravel Request Life Cycle Diagram

An attempt to illustrate the laravel request lifecycle that is documented here (version 12.x when this was uploaded): https://laravel.com/docs/master/lifecycle

TLDR file is the [tldraw.com](https://tldraw.com) source file. 

Feel free to reuse as you'd like and please share any improvements. If you find any issues or comments please let me know.

![Full Diagram](https://raw.githubusercontent.com/Pawel-IT/Laravel-Request-Cycle/a0b3d13f4e0d5c0b539dd4927c6860a98ce94036/Laravel%20Request%20Lifecycle.svg)

# Laravel Request Life Cycle Summary

The Laravel request lifecycle follows a the following path from the initial HTTP request to the final response:

## 1. Entry Point: Public/index.php

All requests to a Laravel application begin at the `public/index.php` file. This file:
- Sets up the application environment
- Loads Composer's autoloader
- Retrieves the application instance from `bootstrap/app.php`

## 2. HTTP/Console Kernel

The request is then passed to either:
- HTTP Kernel (`App\Http\Kernel`) for web requests
- Console Kernel for CLI commands
  - The console kernel has it's own middleware

## 3. Bootstrap Loading

The HTTP Kernel loads several bootstrap classes that:
- Configure error handling
- Configure logging
- Detect the environment
- Register service providers
  - These include any packages or user provided services listed under bootstrap/providers.php
- Boot service providers

## 4. Middleware Processing

Before the request reaches the application logic, it passes through global middleware such as:
- Checking for maintenance mode
- Verifying CSRF tokens
- Setting common headers
- Managing sessions

## 5. Route Processing

The router:
- Matches the request URL against defined routes
- Loads and executes any route-specific middleware
- Resolves the controller or closure to handle the request

## 6. Controller Execution (If Route Points to Controller and not closure)

The controller:
- May inject dependencies using the service container
- Processes the request data
- Interacts with models and services
- Prepares the response data

## 7. Response Creation

The application:
- Formats the response (HTML, JSON, etc.)
- Sets appropriate headers
- Attaches cookies if needed

## 8. Middleware (Again)

The response passes through middleware again, but in reverse order, allowing for:
- Response modification
- Additional headers
- Final processing

## 9. Response to Browser

Finally, the response is sent to the client's browser.

## 10. Termination

After sending the response, Laravel runs termination callbacks and cleanup tasks including any termination middleware (on supported servers).
