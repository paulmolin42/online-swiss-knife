gulp = require 'gulp'

# Gulp Plugins

concat     = require 'gulp-concat'
bowerFiles = require 'main-bower-files'
filter     = require 'gulp-filter'
gutil      = require 'gulp-util'

config =
  vendor_main_file: 'vendor.js'
  web_path: 'web'

gulp.task 'default', ['build']

gulp.task 'build', ['copy', 'compile']

gulp.task 'copy', ['vendors']

gulp.task 'compile', ['coffee', 'index', 'less', 'templates']

gulp.task 'vendors', [], ->
  gulp.src(bowerFiles())
  .pipe filter '**/*.js'
  .pipe concat config.vendor_main_file
  .pipe gulp.dest config.web_path + '/js'
  .on 'error', gutil.log

gulp.task 'coffee', ->
  console.log 'coffee'

gulp.task 'index', ->
  console.log 'index'

gulp.task 'less', ->
  console.log 'less'

gulp.task 'templates', ->
  console.log 'templates'
