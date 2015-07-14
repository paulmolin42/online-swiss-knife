gulp = require 'gulp'

# Gulp Plugins

coffee             = require 'gulp-coffee'
concat             = require 'gulp-concat'
bowerFiles         = require 'main-bower-files'
filter             = require 'gulp-filter'
gutil              = require 'gulp-util'
jade               = require 'gulp-jade'
loopbackSdkAngular = require 'gulp-loopback-sdk-angular'
templateCache      = require 'gulp-angular-templatecache'
runSequence        = require 'run-sequence'

config =
  app_main_file: 'app.js'
  app_path: 'client'
  backend_main_file: 'server/server.js'
  backend_route: '/api'
  loopback_services_main_file: 'lb-services.js'
  templates_file: 'app.templates.js'
  templates_module: 'online-swiss-knife.templates'
  vendor_main_file: 'vendor.js'
  web_path: 'web'

gulp.task 'default', ['build']

gulp.task 'build', (done) ->
  runSequence ['copy', 'compile'], 'lb-services', done

gulp.task 'copy', ['vendors']

gulp.task 'compile', ['coffee', 'index', 'less', 'templates']

gulp.task 'vendors', [], ->
  gulp.src(bowerFiles())
  .pipe filter '**/*.js'
  .pipe concat config.vendor_main_file
  .pipe gulp.dest config.web_path + '/js'
  .on 'error', gutil.log

gulp.task 'coffee', [], ->
  gulp.src config.app_path + '/**/*.coffee'
  .pipe coffee bare: true
  .pipe concat config.app_main_file
  .pipe gulp.dest config.web_path + '/js'
  .on "error", gutil.log

gulp.task 'index', [], ->
  gulp.src config.app_path + '/index.jade'
  .pipe jade pretty: true
  .pipe gulp.dest config.web_path
  .on 'error', gutil.log

gulp.task 'less', ->
  console.log 'less'

gulp.task 'templates', [], ->
  gulp.src config.app_path + '/*/**/*.jade'
  .pipe jade doctype: 'html'
  .pipe templateCache
    filename: config.templates_file
    module: config.templates_module
    standalone: true
  .pipe gulp.dest config.web_path + '/js'
  .on 'error', gutil.log

gulp.task 'lb-services', ->
  gulp.src config.backend_main_file
  .pipe loopbackSdkAngular
    apiUrl: config.backend_route
  .pipe concat config.loopback_services_main_file
  .pipe gulp.dest config.web_path + '/js'
  .once 'end', ->
    process.exit()
