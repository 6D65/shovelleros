gulp = require 'gulp'

coffee = require 'gulp-coffee'
clean = require 'gulp-clean'
shell = require 'gulp-shell'
symlink = require 'gulp-symlink'

paths =
  scripts: ['src/**/*.coffee']
  resources: ['src/Resources/**/*.coffee']
  buildfiles: ['buildfiles/**/*.*', 'buildfiles/.settings', 'buildfiles/.project', 'buildfiles/.cocos-project.json']
  configuration: ['src/*.xml', 'src/*.ccbx']
  frameworks: ['frameworks']

gulp.task 'run-cocos', ->
  shell.task (['cd /vagrant/shovellerosdev/shovelleros/build', 'cocos run -p web --host 0.0.0.0:8080'])

gulp.task 'copy-buildfiles', ->
  gulp.src paths.buildfiles
      .pipe gulp.dest('build/')

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
  gulp.src 'build/**/*.*', read: false
      .pipe clean()

gulp.task 'symlink-frameworks', ->
  gulp.src frameworks
    .pipe (symlink('build/frameworks'))

gulp.task 'build', ['copy-buildfiles', 'copy-config', 'copy-resources', 'compile']

# Rerun the task when a file changes
gulp.task 'watch', ['build'], ->
  gulp.watch paths.resources, ['copy-config']
  gulp.watch paths.resources, ['copy-resources']
  gulp.watch paths.scripts, ['compile']

# The default task (called when you run `gulp` from cli)
gulp.task 'default', ['build']