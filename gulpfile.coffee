gulp = require 'gulp'

coffee = require 'gulp-coffee'
clean = require 'gulp-clean'

paths =
  scripts: ['src/**/*.coffee']
  resources: ['src/Resources/**/*.coffee']
  configuration: ['src/*.xml', 'src/*.ccbx']


gulp.task 'copy-config', ->
# Copy configurations
  gulp.src paths.configuration
      .pipe gulp.dest('build/')

gulp.task 'copy-resources', ->
# Copy resources
  gulp.src paths.resources
      .pipe gulp.dest('build/Resources/')

gulp.task 'compile', ->
# Compile coffee script files
  gulp.src paths.scripts
      .pipe (coffee {bare: true})
      .pipe gulp.dest('build/')

gulp.task 'clean', ->
  gulp.src 'Sources/**/*.*', read: false
      .pipe clean()

gulp.task 'build', ['copy-config', 'copy-resources', 'compile']

# Rerun the task when a file changes
gulp.task 'watch', ['build'], ->
  gulp.watch paths.resources, ['copy-config']
  gulp.watch paths.resources, ['copy-resources']
  gulp.watch paths.scripts, ['compile']

# The default task (called when you run `gulp` from cli)
gulp.task 'default', ['build']