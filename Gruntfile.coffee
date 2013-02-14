module.exports = (grunt) ->
  grunt.initConfig
    pkg: "<json:package.json>"
    banner: """

                     #@@##@@@@@A;
                     :A@@@@@@@@@@@@#GS;
                       3@MMMMM##@@@@@@@@@@&52X9i
                       S#AAAAAHBBM###@@@@@@@@@@@@#5r;:
                iH####M#HAAAAAHHHHHBBMM###@@@@@@@@@@@@@#;
                @@@@@@#HAAAAAAAAAAHAHHHBBBBBMM###@@@@@@@@@@r
                 s#HAAAA&AAAAAAAAAAHHHHHHHHBBHBMMMM###@@@@@@@r
                 iMGG&&G&&AAAAAAAAAAAAHHHBBHBBBBMBBBMM###@@@@@@;
                r@AGhG&&&&&A&AAAAAAAAHHAHAHBBBBBBBBMBMMMM##@@@@@@:
                #BhGGGGG&&&&&&&AAAAAAAAAHHHMMMM##MBBBMMMMMMM#@@@@@@:
              ;@#GhhGhhGGG&&&&&AAAAAAHBM#@##MB#hB@#MMBMMMMMMM##@@@@@M
             i@Mhh9hGhhhG&&&&&AAAB##MMM&5;       S@@MBBMMBMMBMM##@@@@h
            i@A999hAAHHHHBMMM#MBA3i                #@#MBBMMMMMMM###@@@@5
            @B3339Grrsssrr;;:                       5@@#MMMMMMMBMM##@@@@:
           :@h333BS                                   S#@@#MBMMMMMMM##@@@;
           :MXX3Hi                                       s@#MBBMMMBMM##@@@
           hAX9G                                          &@#MBBMMMMMM##@@
          r#3X&                                            r@@#MMMMMMBM#@@
          #G2GS                                              5@#MBBBMBMM@X
         9M22As                                                @MBBBBMM#@
        :#322Mr                                               :@BHBBBBB@B
        sM222M;                                              ;@#HHHHBBH@;
        iH252M                                               A@BHHHHHH#@
        :B25XB                                               5@HAHHHHH@#
         2&22#                            ;X5 :iXhhXSr;      ;@HAAHHAH@5
          3X2B5                        ;A@@@@@@@@@@@@@@@@@As r@AAAHHA#M
           h23MsshM@@@GX              r@@#HAHMBHAAAHHM##@@@@@#HAAAAAA@S
           h229HMMA&&A#@#         :2HA#MGhGG&A&A&AAAAAHHBBMMMHAAAAAAA@;
       :&AH9399hh9939hhA@#;      &@@@#BAAA&&GGGGhG&&AAABBBMBAAAAAAAAA@:
       @@X;;;:::;;;rrrrrs#@@@@@@@#A9&:                     r#A&&&AAAA@:
      2B3r               &&A2XXXX93h2                       @A&&&AAAH@9
      2G2G               HMr     SGH;                       BB&&G&&AH@@M
       &hM:              @A      3B#                        2#&&&&GH#AA@2
        5@B             r@:      s##:                       5MG&GGB3
         :#MX39h999hGABM@G        #@@#Bh5irr;;;;rrs5XGA#@@@@#H&GhH9
           X@#GAAAA&h35rr           rXA#@@@@@@@@@@@@@@@@@@M&SiA&GM
            A3                                                M&B5
            X#                                               :#G#:
            r@:                                              &MA#
             @5                                             S@hHA
             i2                                            s@&3M2
                                                          S@A3X#s
             Built: <%= grunt.template.today("yyyy-mm-dd") %>                            B@33G@;
                                                           9MAGs
                                                            :

    """

    # Source files...
    files:
      assets: ['**/*', '!{scripts,style,templates,images}/**']

    # Command configuration (should not have to mess with)
    clean:
      app: ['build', 'tmp']

    coffee:
      app:
        expand: true
        cwd: 'app/scripts'
        src: ['**/*.coffee']
        dest: 'tmp/scripts'
        ext: '.js'

    commonjs:
      app:
        cwd: 'tmp/scripts'
        dest: 'tmp/scripts-wrapped/'
        src: ['**/*.js']

    concat:
      options:
        banner: '/*<%= banner %>*/\n'
      app:
        src: ['app/scripts/vendor/**/*.js', 'tmp/scripts-wrapped/**/*.js']
        dest: 'build/js/app.js'
      style:
        src: ['app/style/vendor/**/*.css', 'tmp/style/**/*.css']
        dest: 'build/css/app.css'

    connect:
      app:
        options:
          port: 8000
          base: 'build'

    copy:
      app:
        files: [
          expand: true
          cwd: 'app/'
          src: '<%= files.assets %>'
          dest: 'build/'
        ,
          expand: true
          cwd: 'app/images'
          src: '**'
          dest: 'build/img/'
        ]


    handlebars:
      app:
        expand: yes
        cwd: 'app/templates/'
        dest: 'tmp/templates/'
        src: '**/*.hbs'
        ext: '.js'

    livereload:
      options:
        base: 'build'
      files: ['build/**']

    mincss:
      app:
        expand: yes
        cwd: 'tmp/style'
        src: ['vendor/**/*.css', '**/*.css']
        dest: 'build/css/'

    stylus:
      app:
        # options:
        #   paths: ['app/style']
        expand: yes
        cwd: 'app/style'
        dest: 'tmp/style/'
        src: '**/*.styl'
        ext: '.css'
        # files:
        #   'tmp/style/app.css': 'app/style/**/*.styl'

    watch:
      assets:
        files: ['app/**/*', '!app/{scripts,style,templates,images}/**']
        tasks: ['copy', 'livereload']
        options:
          interrupt: yes
      css:
        files: ['app/**/*.styl']
        tasks: ['stylus', 'concat:style']
        options:
          interrupt: yes
      coffee:
        files: ['app/**/*.coffee']
        tasks: ['coffee', 'commonjs', 'concat:app']
  # grunt.loadNpmTasks 'grunt-assets-revving'
  grunt.loadNpmTasks 'grunt-commonjs'
  # grunt.loadNpmTasks 'grunt-commonjs-handlebars'
  grunt.loadNpmTasks 'grunt-contrib-clean'
  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-contrib-concat'
  grunt.loadNpmTasks 'grunt-contrib-connect'
  grunt.loadNpmTasks 'grunt-contrib-copy'
  grunt.loadNpmTasks 'grunt-contrib-mincss'
  grunt.loadNpmTasks 'grunt-contrib-stylus'
  grunt.loadNpmTasks 'grunt-contrib-uglify'
  grunt.loadNpmTasks 'grunt-contrib-watch'
  grunt.loadNpmTasks 'grunt-livereload'
  # grunt.loadNpmTasks 'grunt-mocha'
  # grunt.loadNpmTasks 'grunt-modernizr'
  # grunt.loadNpmTasks 'grunt-strip'

  grunt.registerTask 'scripts', ['coffee:app', 'commonjs:app', 'concat:app']

  grunt.registerTask 'default', ['copy', 'coffee', 'commonjs', 'stylus', 'concat']

  grunt.registerTask 'server', ['default', 'connect', 'livereload', 'watch']