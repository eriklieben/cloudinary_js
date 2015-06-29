`/*
 * Cloudinary's jQuery library - v1.0.24
 * Copyright Cloudinary
 * see https://github.com/cloudinary/cloudinary_js
 */

(function (factory) {
    'use strict';
    if (typeof define === 'function' && define.amd) {
        // Register as an anonymous AMD module:
        define([
            'jquery',
            'jquery.ui.widget',
            'jquery.iframe-transport',
            'jquery.fileupload'
        ], factory);
    } else {
        // Browser globals:
        var $ = window.jQuery;
        factory($);
        $(function() {
            if($.fn.cloudinary_fileupload !== undefined) {
                $("input.cloudinary-fileupload[type=file]").cloudinary_fileupload();
            }
        });
    }
}(function ($) {
`
crc32 = (str) ->
# http://kevin.vanzonneveld.net
# +   original by: Webtoolkit.info (http://www.webtoolkit.info/)
# +   improved by: T0bsn
# +   improved by: http://stackoverflow.com/questions/2647935/javascript-crc32-function-and-php-crc32-not-matching
# -    depends on: utf8_encode
# *     example 1: crc32('Kevin van Zonneveld');
# *     returns 1: 1249991249
  str = utf8_encode str

  table = '00000000 77073096 EE0E612C 990951BA 076DC419 706AF48F E963A535 9E6495A3 0EDB8832 79DCB8A4 E0D5E91E 97D2D988 09B64C2B 7EB17CBD E7B82D07 90BF1D91 1DB71064 6AB020F2 F3B97148 84BE41DE 1ADAD47D 6DDDE4EB F4D4B551 83D385C7 136C9856 646BA8C0 FD62F97A 8A65C9EC 14015C4F 63066CD9 FA0F3D63 8D080DF5 3B6E20C8 4C69105E D56041E4 A2677172 3C03E4D1 4B04D447 D20D85FD A50AB56B 35B5A8FA 42B2986C DBBBC9D6 ACBCF940 32D86CE3 45DF5C75 DCD60DCF ABD13D59 26D930AC 51DE003A C8D75180 BFD06116 21B4F4B5 56B3C423 CFBA9599 B8BDA50F 2802B89E 5F058808 C60CD9B2 B10BE924 2F6F7C87 58684C11 C1611DAB B6662D3D 76DC4190 01DB7106 98D220BC EFD5102A 71B18589 06B6B51F 9FBFE4A5 E8B8D433 7807C9A2 0F00F934 9609A88E E10E9818 7F6A0DBB 086D3D2D 91646C97 E6635C01 6B6B51F4 1C6C6162 856530D8 F262004E 6C0695ED 1B01A57B 8208F4C1 F50FC457 65B0D9C6 12B7E950 8BBEB8EA FCB9887C 62DD1DDF 15DA2D49 8CD37CF3 FBD44C65 4DB26158 3AB551CE A3BC0074 D4BB30E2 4ADFA541 3DD895D7 A4D1C46D D3D6F4FB 4369E96A 346ED9FC AD678846 DA60B8D0 44042D73 33031DE5 AA0A4C5F DD0D7CC9 5005713C 270241AA BE0B1010 C90C2086 5768B525 206F85B3 B966D409 CE61E49F 5EDEF90E 29D9C998 B0D09822 C7D7A8B4 59B33D17 2EB40D81 B7BD5C3B C0BA6CAD EDB88320 9ABFB3B6 03B6E20C 74B1D29A EAD54739 9DD277AF 04DB2615 73DC1683 E3630B12 94643B84 0D6D6A3E 7A6A5AA8 E40ECF0B 9309FF9D 0A00AE27 7D079EB1 F00F9344 8708A3D2 1E01F268 6906C2FE F762575D 806567CB 196C3671 6E6B06E7 FED41B76 89D32BE0 10DA7A5A 67DD4ACC F9B9DF6F 8EBEEFF9 17B7BE43 60B08ED5 D6D6A3E8 A1D1937E 38D8C2C4 4FDFF252 D1BB67F1 A6BC5767 3FB506DD 48B2364B D80D2BDA AF0A1B4C 36034AF6 41047A60 DF60EFC3 A867DF55 316E8EEF 4669BE79 CB61B38C BC66831A 256FD2A0 5268E236 CC0C7795 BB0B4703 220216B9 5505262F C5BA3BBE B2BD0B28 2BB45A92 5CB36A04 C2D7FFA7 B5D0CF31 2CD99E8B 5BDEAE1D 9B64C2B0 EC63F226 756AA39C 026D930A 9C0906A9 EB0E363F 72076785 05005713 95BF4A82 E2B87A14 7BB12BAE 0CB61B38 92D28E9B E5D5BE0D 7CDCEFB7 0BDBDF21 86D3D2D4 F1D4E242 68DDB3F8 1FDA836E 81BE16CD F6B9265B 6FB077E1 18B74777 88085AE6 FF0F6A70 66063BCA 11010B5C 8F659EFF F862AE69 616BFFD3 166CCF45 A00AE278 D70DD2EE 4E048354 3903B3C2 A7672661 D06016F7 4969474D 3E6E77DB AED16A4A D9D65ADC 40DF0B66 37D83BF0 A9BCAE53 DEBB9EC5 47B2CF7F 30B5FFE9 BDBDF21C CABAC28A 53B39330 24B4A3A6 BAD03605 CDD70693 54DE5729 23D967BF B3667A2E C4614AB8 5D681B02 2A6F2B94 B40BBE37 C30C8EA1 5A05DF1B 2D02EF8D'
  crc = 0
  x = 0
  y = 0
  crc = crc ^ -1
  i = 0
  iTop = str.length
  while i < iTop
    y = (crc ^ str.charCodeAt(i)) & 0xFF
    x = '0x' + table.substr(y * 9, 8)
    crc = crc >>> 8 ^ x
    i++
  crc = crc ^ -1
  #convert to unsigned 32-bit int if needed
  if crc < 0
    crc += 4294967296
  crc

if typeof module != "undefined" && module.exports
  #On a server
  exports.crc32 = crc32
else
  #On a client
  window.crc32 = crc32

utf8_encode = (argString) ->
# http://kevin.vanzonneveld.net
# +   original by: Webtoolkit.info (http://www.webtoolkit.info/)
# +   improved by: Kevin van Zonneveld (http://kevin.vanzonneveld.net)
# +   improved by: sowberry
# +    tweaked by: Jack
# +   bugfixed by: Onno Marsman
# +   improved by: Yves Sucaet
# +   bugfixed by: Onno Marsman
# +   bugfixed by: Ulrich
# +   bugfixed by: Rafal Kukawski
# +   improved by: kirilloid
# *     example 1: utf8_encode('Kevin van Zonneveld');
# *     returns 1: 'Kevin van Zonneveld'
  if argString == null or typeof argString == 'undefined'
    return ''
  string = argString + ''
  # .replace(/\r\n/g, "\n").replace(/\r/g, "\n");
  utftext = ''
  start = undefined
  end = undefined
  stringl = 0
  start = end = 0
  stringl = string.length
  n = 0
  while n < stringl
    c1 = string.charCodeAt(n)
    enc = null
    if c1 < 128
      end++
    else if c1 > 127 and c1 < 2048
      enc = String.fromCharCode(c1 >> 6 | 192, c1 & 63 | 128)
    else
      enc = String.fromCharCode(c1 >> 12 | 224, c1 >> 6 & 63 | 128, c1 & 63 | 128)
    if enc != null
      if end > start
        utftext += string.slice(start, end)
      utftext += enc
      start = end = n + 1
    n++
  if end > start
    utftext += string.slice(start, stringl)
  utftext


if typeof module != "undefined" && module.exports
#On a server
  exports.utf8_encode = utf8_encode
else
#On a client
  window.utf8_encode = utf8_encode


#_ = require("lodash")
cloudinary_config = undefined

class CloudinaryConfiguration
  DEFAULT_VIDEO_SOURCE_TYPES = ['webm', 'mp4', 'ogv'] # TODO remove from Cloudinary
  DEFAULT_POSTER_OPTIONS = { format: 'jpg', resource_type: 'video' }

  ###*
  # Defaults configuration.
  #
  # (Previously defined using option_consume() )
  ###
  DEFAULT_CONFIGURATION_PARAMS ={
    secure: window?.location?.protocol == 'https:'
  }


  constructor: (options ={})->
    @configuration = _.cloneDeep(options)
    _.defaults( @configuration, DEFAULT_CONFIGURATION_PARAMS)


  # Set or update the configuration
  # @param {String|Object} config
  set:(config, value)->
    if _.isUndefined(value)
      @merge(config) if _.isPlainObject(config)
    else
      @config[config] = value
    this

  get: (name)->
    @configuration[name]

  merge: (config={})->
    _.assign(@configuration, config)
  fromDocument: ->
    meta_elements = document?.getElementsByTagName("meta");
    if meta_elements
      for el in meta_elements
        @cloudinary[el.getAttribute('name').replace('cloudinary_', '')] = el.getAttribute('content')
    this

  fromEnvironment: ->
    cloudinary_url = process?.env?.CLOUDINARY_URL
    if cloudinary_url?
      uri = require('url').parse(cloudinary_url, true)
      cloudinary =
        cloud_name: uri.host,
        api_key: uri.auth and uri.auth.split(":")[0],
        api_secret: uri.auth and uri.auth.split(":")[1],
        private_cdn: uri.pathname?,
        secure_distribution: uri.pathname and uri.pathname.substring(1)
      if uri.query?
        for k, v of uri.query
          cloudinary[k] = v
    this

  # Create or modify the Cloudinary client configuration
  #
  # This is a backward compatibility method. For new code, use get(), merge() etc.
  #
  # @param {Hash|String|true} new_config
  # @param {String} new_value
  # @returns {*}
  config: (new_config, new_value) ->
    if !@configuration? || new_config == true
      @fromEnvironment()
      @fromDocument() unless @configuration
    unless _.isUndefined(new_value)
      @set(new_config, new_value)
      @configuration
    else if _.isString(new_config)
      @get(new_config)
    else if _.isObject(new_config)
      @merge(new_config)
      @configuration
    else
      @configuration

  # Whitelisted default options
  defaults: ()->
    _.pick(@configuration, [
      "cdn_subdomain"
      "cloud_name"
      "cname"
      "dpr"
      "fallback_content"
      "private_cdn"
      "protocol"
      "resource_type"
      "responsive_width"
      "secure"
      "secure_cdn_subdomain"
      "secure_distribution"
      "shorten"
      "source_transformation"
      "source_types"
      "transformation"
      "type"
      "use_root_path"

    ])


if module?.exports
#On a server
# module.exports = (new_config, new_value) ->

  exports.CloudinaryConfiguration = CloudinaryConfiguration
else
#On a client
  window.CloudinaryConfiguration = CloudinaryConfiguration


config = config || -> {}

###*
# Parameters that are filtered out before passing the options to an HTML tag
###
filtered_transformation_params = [
  "angle"
  "audio_codec"
  "audio_frequency"
  "background"
  "bit_rate"
  "border"
  "cdn_subdomain"
  "cloud_name"
  "cname"
  "color"
  "color_space"
  "crop"
  "default_image"
  "delay"
  "density"
  "dpr"
  "dpr"
  "duration"
  "effect"
  "end_offset"
  "fallback_content"
  "fetch_format"
  "format"
  "flags"
  "gravity"
  "offset"
  "opacity"
  "overlay"
  "page"
  "prefix"
  "private_cdn"
  "protocol"
  "quality"
  "radius"
  "raw_transformation"
  "resource_type"
  "responsive_width"
  "secure"
  "secure_cdn_subdomain"
  "secure_distribution"
  "shorten"
  "size"
  "source_transformation"
  "source_types"
  "start_offset"
  "transformation"
  "type"
  "underlay"
  "use_root_path"
  "video_codec"
  "video_sampling"
  "x"
  "y"
  "zoom"

]

###*
# Defaults values for parameters.
#
# (Previously defined using option_consume() )
###
default_transformation_params ={
  cdn_subdomain: config().cdn_subdomain
  cloud_name: config().cloud_name
  cname: config().cname
  dpr: config().dpr
  fallback_content: ''
  private_cdn: config().private_cdn
  protocol: config().protocol
  resource_type: "image"
  responsive_width: config().responsive_width
  secure: window.location.protocol == 'https:'
  secure_cdn_subdomain: config().secure_cdn_subdomain
  secure_distribution: config().secure_distribution
  shorten: config().shorten
  source_transformation: {}
  source_types: []
  transformation: []
  type: 'upload'
  use_root_path: config().use_root_path

}

class Param
  constructor: (@name, @short, @process = _.identity)->
    #console.log("setting up " + @name)

  set: (@value)->
    #console.log("Set " + @name + "= " + @value)
    this

  flatten: ->
    #console.log("flatten #{@value}")
    #console.dir(this)
    val = @process(@value)
    if @short? && val?
      "#{@short }_#{val}"
    else
      null

  @norm_range_value: (value) ->
    offset = String(value).match(new RegExp('^' + offset_any_pattern + '$'))
    if offset
      modifier = if offset[5]? then 'p' else ''
      value = (offset[1] or offset[4]) + modifier
    value

  @norm_color: (value) -> value?.replace(/^#/, 'rgb:')

  build_array: (arg = []) ->
    if _.isArray(arg)
      arg
    else
      [arg]


class ArrayParam extends Param
  constructor: (@name, @short, @sep = '.', @process = _.identity) ->
    super(@name, @short, @process)
  flatten: -> #FIXME when to handle string?
    if @short?
      flat = for t in @value
        if _.isFunction( t.flatten)
          t.flatten() # Param or Transformation
        else
          t
      "#{@short}_#{flat.join(@sep)}"
    else
      null
  set: (@value)->
    if _.isArray(@value)
      super(@value)
    else
      super([@value])

class TransformationParam extends Param
  constructor: (@name, @short = "t", @sep = '.', @process = _.identity) ->
    super(@name, @short, @process)
  flatten: -> #FIXME when to handle string?
    result = if _.isEmpty(@value)
      null
    else if _.all(@value, _.isString)
      ["#{@short}_#{@value.join(@sep)}"]
    else
      for t in @value when t?
        if _.isString( t)
          "#{@short}_#{t}"
        else if _.isFunction( t.flatten)
          t.flatten()
        else if _.isPlainObject(t)
          new Transformation(t).flatten()
    _.compact(result)
  set: (@value)->
    if _.isArray(@value)
      super(@value)
    else
      super([@value])

class RangeParam extends Param
  constructor: (@name, @short, @process = @norm_range_value)->
    super(@name, @short, @process)

#class FetchParam extends Param
#  constructor: (@name = "fetch", @short = "f", @process = _.identity)->
#    super(@name, @short, @process)
#  flatten: ->
#    "#{@short}/#{@value}"

class RawParam extends Param
  constructor: (@name, @short, @process = _.identity)->
    super(@name, @short, @process)
  flatten: ->
    @value


###*
# A video codec parameter can be either a String or a Hash.
# @param {Object} param <code>vc_<codec>[ : <profile> : [<level>]]</code>
#                       or <code>{ codec: 'h264', profile: 'basic', level: '3.1' }</code>
# @return {String} <code><codec> : <profile> : [<level>]]</code> if a Hash was provided
#                   or the param if a String was provided.
#                   Returns null if param is not a Hash or String
###
process_video_params = (param) ->
  switch param.constructor
    when Object
      video = ""
      if 'codec' of param
        video = param['codec']
        if 'profile' of param
          video += ":" + param['profile']
          if 'level' of param
            video += ":" + param['level']
      video
    when String
      param
    else
      null


number_pattern = "([0-9]*)\\.([0-9]+)|([0-9]+)";
offset_any_pattern = "(#{number_pattern })([%pP])?";
#_log = console.log
#console.log = (value)->
#  out = document.getElementById("output")
#  out.innerHTML += "<p>#{value}</p>"
#  _log(value)

class TransformationBase
  param: (value, name, abbr, default_value, process) ->
    unless process?
      if _.isFunction(default_value)
        process = default_value
      else
        process = _.identity
    #console.dir(@)
    #console.dir(@trans)
    @trans[name] = new Param(name, abbr, process).set(value)

  rawParam: (value, name, abbr, default_value, process = _.identity) ->
    process = default_value if _.isFunction(default_value) && !process?
    @trans[name] = new RawParam(name, abbr, process).set(value)

#  fetchParam: (value, name, abbr, default_value, process = _.identity) ->
#    process = default_value if _.isFunction(default_value) && !process?
#    @trans[name] = new FetchParam(name, abbr, process).set(value)

  rangeParam: (value, name, abbr, default_value, process = _.identity) ->
    process = default_value if _.isFunction(default_value) && !process?
    @trans[name] = new RangeParam(name, abbr, process).set(value)

  arrayParam: (value, name, abbr, sep = ":", default_value = [], process = _.identity) ->
    process = default_value if _.isFunction(default_value) && !process?
    @trans[name] = new ArrayParam(name, abbr, sep, process).set(value)

  transformationParam: (value, name, abbr, sep = ".", default_value, process = _.identity) ->
    process = default_value if _.isFunction(default_value) && !process?
    @trans[name] = new TransformationParam(name, abbr, sep, process).set(value)


  constructor: (options = {})->
    @trans = {}
    @exclude_list = []
    @whitelist = _.functions(TransformationBase.prototype)
    _.difference(@whitelist, ["_set", "param", "rawParam", "rangeParam", "arrayParam"])
#    console.log(@whitelist)
  angle: (value)->            @param value, "angle", "a"
  audio_codec: (value)->      @param value, "audio_codec", "ac"
  audio_frequency: (value)->  @param value, "audio_frequency", "af"
  background: (value)->       @param value, "background", "b", Param.norm_color
  bit_rate: (value)->         @param value, "bit_rate", "br"
  border: (value)->           @param value, "border", "bo", (border) ->
    if (_.isPlainObject(border))
      border = _.assign({}, {color: "black", width: 2}, border)
      "#{border.width}px_solid_#{Param.norm_color(border.color)}"
    else
      border
  color: (value)->            @param value, "color", "co", Param.norm_color
  color_space: (value)->      @param value, "color_space", "cs"
  crop: (value)->             @param value, "crop", "c"
  default_image: (value)->    @param value, "default_image", "d"
  delay: (value)->            @param value, "delay", "l"
  density: (value)->          @param value, "density", "dn"
  duration: (value)->         @rangeParam value, "duration", "du"
  dpr: (value)->              @param value, "dpr", "dpr", (dpr) ->
    dpr = dpr.toString()
    if (dpr == "auto")
      "1.0"
    else if (dpr?.match(/^\d+$/))
      dpr + ".0"
    else
      dpr
  effect: (value)->           @arrayParam value,  "effect", "e", ":"
  end_offset: (value)->       @rangeParam value,  "end_offset", "eo"
  fetch_format: (value)->     @param value,       "fetch_format", "f"
  format: (value)->           @param value,       "format"
  flags: (value)->            @arrayParam value,  "flags", "fl", "."
  gravity: (value)->          @param value,       "gravity", "g"
  height: (value)->           @param value,       "height", "h", =>
    if _.any([ @getValue("crop"), @getValue("overlay"), @getValue("underlay")])
      value
    else
      null
  html_height: (value)->      @param value, "html_height"
  html_width:(value)->        @param value, "html_width"
  offset: (value)->
    [start_o, end_o] = if( _.isFunction(value?.split))
      value.split('..')
    else if _.isArray(value)
      value
    else
      [null,null]
    @start_offset(start_o) if start_o?
    @end_offset(end_o) if end_o?
  opacity: (value)->          @param value, "opacity",  "o"
  overlay: (value)->          @param value, "overlay",  "l"
  page: (value)->             @param value, "page",     "pg"
  prefix: (value)->           @param value, "prefix",   "p"
  quality: (value)->          @param value, "quality",  "q"
  radius: (value)->           @param value, "radius",   "r"
  raw_transformation: (value)-> @rawParam value, "raw_transformation"
  size: (value)->
    if( _.isFunction(value?.split))
      [width, height] = value.split('x')
      @width(width)
      @height(height)
  start_offset: (value)->     @rangeParam value, "start_offset", "so"
  transformation: (value)->   @transformationParam value, "transformation"
  underlay: (value)->         @param value, "underlay", "u"
  video_codec: (value)->      @param value, "video_codec", "vc", process_video_params
  video_sampling: (value)->   @param value, "video_sampling", "vs"
  width: (value)->            @param value, "width", "w", =>
    if _.any([ @getValue("crop"), @getValue("overlay"), @getValue("underlay")])
      value
    else
      null
  x: (value)->                @param value, "x", "x"
  y: (value)->                @param value, "y", "y"
  zoom: (value)->             @param value, "zoom", "z"

###*
#  A single transformation.
#
#  Usage:
#
#      t = new Transformation();
#      t.angle(20).crop("scale").width("auto");
#
#  or
#      t = new Transformation( {angle: 20, crop: "scale", width: "auto"});
###
class Transformation extends TransformationBase
  constructor: (options = {}) ->
    # TODO dup options
    super()
    this.fromOptions(options)
  fromOptions: (options = {}) ->
    options = {transformation: options } if _.isString(options) || _.isArray(options)
    #console.dir(_.intersection(options, @whitelist))
    for k in _.intersection(_.keys(options), @whitelist)
#      console.log("setting #{k} to #{options[k]}")
      this[k](options[k])
    this
  getValue: (name)->
    @trans[name]?.value
  get: (name)->
    @trans[name]
  remove: (name)->
    temp = @trans[name]
    delete @trans[name]
    temp
  flatten: ->
    result_array = []
#    console.log("filtered_transformation_params")
#    console.log(filtered_transformation_params)
    transformations = @remove("transformation");
    if transformations
      result_array = result_array.concat( transformations.flatten())
    unless _.any([ @getValue("overlay"), @getValue("underlay"), @getValue("angle"), _.contains( ["fit", "limit", "lfill"],@getValue("crop"))])
      width = @getValue("width")
      height = @getValue("height")
      if width && width != "auto" && parseFloat(width) >= 1.0
        @html_width(width) unless @getValue("html_width")
      if @get("height") && parseFloat(height) >= 1.0
        @html_height(height) unless @getValue("html_height")
# TODO will this have affect on client code? (shouldn't because public api dup options)
#    unless _.any([ @getValue("crop"), @getValue("overlay"), @getValue("underlay")])
#      @remove("width")
#      @remove("height")

    param_list = _.keys(@trans).sort()

    transformation_string = (@get(t)?.flatten() for t in param_list )
    transformation_string = _.filter(transformation_string, (value)->
      _.isArray(value) &&!_.isEmpty(value) || !_.isArray(value) && value
    ).join(',')
    result_array.push(transformation_string) unless _.isEmpty(transformation_string)
    _.compact(result_array).join('/')

  listNames: ->
    @whitelist

  toPlainObject: ()->
    hash = {}
    hash[key] = @trans[key].value for key of @trans
    hash

  ###*
  # Returns an options object with attributes for an HTML tag.
  #
  # @param {Object} options if provided, this object will be muted
  ###
  toHtmlTagOptions: (options = {})->
    # delete any filtered key or options.keys - @trans
    # copy rest
    # rest = @trans.keys - filtered
    delete_keys = _.union( filtered_transformation_params,
                    _.difference(_.keys(options), _.keys(@trans)))
    delete options[key] for key in delete_keys
    options[key] = @trans[key].value for key in _.difference(_.keys(@trans ), filtered_transformation_params)
    options.width == options.html_width if options.html_width
    options.height == options.html_height if options.html_height

    options

  isValidParamName: (name) ->
    @whitelist.indexOf(name) >= 0


if module?.exports
#On a server
  exports.Transformation = Transformation
else
#On a client
  window.Transformation = Transformation




###
  Main Cloudinary class

  Backward compatibility:
  Must provide public keys
   * CF_SHARED_CDN
   * OLD_AKAMAI_SHARED_CDN
   * AKAMAI_SHARED_CDN
   * SHARED_CDN
   * config
   * url
   * video_url
   * video_thumbnail_url
   * url_internal
   * transformation_string
   * image
   * video_thumbnail
   * facebook_profile_image
   * twitter_profile_image
   * twitter_name_profile_image
   * gravatar_image
   * fetch_image
   * video
   * sprite_css
   * responsive
   * calc_stoppoint
   * device_pixel_ratio
   * supported_dpr_values

###
class Cloudinary
  CF_SHARED_CDN = "d3jpl91pxevbkh.cloudfront.net";
  OLD_AKAMAI_SHARED_CDN = "cloudinary-a.akamaihd.net";
  AKAMAI_SHARED_CDN = "res.cloudinary.com";
  SHARED_CDN = AKAMAI_SHARED_CDN;
  DEFAULT_POSTER_OPTIONS = { format: 'jpg', resource_type: 'video' };
  DEFAULT_VIDEO_SOURCE_TYPES = ['webm', 'mp4', 'ogv'];
  device_pixel_ratio_cache = {}

  ###*
  # Defaults values for parameters.
  #
  # (Previously defined using option_consume() )
  ###
  DEFAULT_IMAGE_PARAMS ={
    resource_type: "image"
    transformation: []
    type: 'upload'
  }

  ###*
  # Defaults values for parameters.
  #
  # (Previously defined using option_consume() )
  ###
  DEFAULT_VIDEO_PARAMS ={
    fallback_content: ''
    resource_type: "video"
    source_transformation: {}
    source_types: DEFAULT_VIDEO_SOURCE_TYPES
    transformation: []
    type: 'upload'
  }

  ###*
   * Return the resource type and action type based on the given configuration
   * @param resource_type
   * @param type
   * @param url_suffix
   * @param use_root_path
   * @param shorten
   * @returns {string} resource_type/type ###
  finalize_resource_type = (resource_type,type,url_suffix,use_root_path,shorten) ->
    if _.isPlainObject(resource_type)
      options = resource_type
      resource_type = options.resource_type
      type = options.type
      url_suffix = options.url_suffix
      use_root_path = options.use_root_path
      shorten = options.shorten

    type?='upload'
    if url_suffix?
      if resource_type=='image' && type=='upload'
        resource_type = "images"
        type = null
      else if resource_type== 'raw' && type== 'upload'
        resource_type = 'files'
        type = null
      else
        throw new Error("URL Suffix only supported for image/upload and raw/upload")
    if use_root_path
      if (resource_type== 'image' && type== 'upload' || resource_type == "images")
        resource_type = null
        type = null
      else
        throw new Error("Root path only supported for image/upload")
    if shorten && resource_type== 'image' && type== 'upload'
      resource_type = 'iu'
      type = null
    [resource_type,type].join("/")

  absolutize = (url) ->
    if !url.match(/^https?:\//)
      prefix = document.location.protocol + '//' + document.location.host
      if url[0] == '?'
        prefix += document.location.pathname
      else if url[0] != '/'
        prefix += document.location.pathname.replace(/\/[^\/]*$/, '/')
      url = prefix + url
    url

  cloudinary_url = (public_id, options = {}) ->
    _.defaults(options, @configuration.defaults(), DEFAULT_IMAGE_PARAMS)
    if options.type == 'fetch'
      options.fetch_format = options.fetch_format or options.format
      public_id = absolutize(public_id)

    transformation = new Transformation(options)
    transformation_string = transformation.flatten()

    throw 'Unknown cloud_name' unless options.cloud_name

    throw 'URL Suffix only supported in private CDN' if options.url_suffix and !options.private_cdn

    # if public_id has a '/' and doesn't begin with v<number> and doesn't start with http[s]:/ and version is empty
    # TODO Using !options.version?.toString() fixes bug when version == null
    if public_id.search('/') >= 0 and !public_id.match(/^v[0-9]+/) and !public_id.match(/^https?:\//) and !options.version?.toString()
      options.version = 1

    if public_id.match(/^https?:/)
      if options.type == 'upload' or options.type == 'asset'
        url = public_id
      else
        public_id = encodeURIComponent(public_id).replace(/%3A/g, ':').replace(/%2F/g, '/')
    else
      # Make sure public_id is URI encoded.
      public_id = encodeURIComponent(decodeURIComponent(public_id)).replace(/%3A/g, ':').replace(/%2F/g, '/')
      if options.url_suffix
        if options.url_suffix.match(/[\.\/]/)
          throw 'url_suffix should not include . or /'
        public_id = public_id + '/' + options.url_suffix
      if options.format
        if !options.trust_public_id
          public_id = public_id.replace(/\.(jpg|png|gif|webp)$/, '')
        public_id = public_id + '.' + options.format

    prefix = cloudinary_url_prefix(public_id, options)
    resource_type_and_type = finalize_resource_type(options.resource_type, options.type, options.url_suffix, options.use_root_path, options.shorten)
    version = if options.version then 'v' + options.version else ''

    transformation.toHtmlTagOptions(options) # backward compatibility - options is mutated

    url ||  _.filter([
      prefix
      resource_type_and_type
      transformation_string
      version
      public_id
    ], null).join('/').replace(/([^:])\/+/g, '$1/')

  constructor: (options)->
    @configuration = new CloudinaryConfiguration(options)

  # Provided for backward compatibility
  config: (new_config, new_value) ->
    @configuration.config(new_config, new_value)

  # Generate a resource URL
  url: (public_id, options) ->
    options = _.cloneDeep( options)
    cloudinary_url.call this, public_id, options
  video_url: (public_id, options) ->
    options = _.merge({ resource_type: 'video' }, options)
    cloudinary_url.call this,  public_id, options
  video_thumbnail_url: (public_id, options) ->
    options = _.merge({}, DEFAULT_POSTER_OPTIONS, options)
    cloudinary_url.call this, public_id, options
  url_internal: cloudinary_url
  transformation_string: (options) ->
    options = _.cloneDeep( options)
    generate_transformation_string options
  image: (public_id, options={}) ->
    options = _.defaults(_.cloneDeep(options),@configuration.defaults(), DEFAULT_IMAGE_PARAMS)
    src = cloudinary_url.call(this, public_id, options)
    options["src"] = src
    new ImageTag(options).toHtml()

  video_thumbnail: (public_id, options) ->
    image public_id, _.extend( {}, DEFAULT_POSTER_OPTIONS, options)

  facebook_profile_image: (public_id, options) ->
    @image public_id, _.merge({ type: 'facebook' }, options)
  twitter_profile_image: (public_id, options) ->
    @image public_id, _.merge({ type: 'twitter' }, options)
  twitter_name_profile_image: (public_id, options) ->
    @image public_id, _.merge({ type: 'twitter_name' }, options)
  gravatar_image: (public_id, options) ->
    @image public_id, _.merge({ type: 'gravatar' }, options)
  fetch_image: (public_id, options) ->
    @image public_id, _.merge({ type: 'fetch' }, options)
  video: (public_id, options = {}) ->
    options = _.defaults(_.cloneDeep(options),@configuration.defaults(), DEFAULT_VIDEO_PARAMS)
    public_id = public_id.replace(/\.(mp4|ogv|webm)$/, '')

    source_types = options['source_types']
    source_transformation = options['source_transformation']
    fallback = options['fallback_content']

    video_options = _.cloneDeep(options)
    if video_options.hasOwnProperty('poster')
      if _.isPlainObject(video_options.poster) # else assume it is a literal poster string or `false`
        if video_options.poster.hasOwnProperty('public_id')
          # poster is a regular image
          video_options.poster = cloudinary_url.call( this, video_options.poster.public_id, video_options.poster)
        else # use the same public_id as the video, with video defaults
          video_options.poster = cloudinary_url.call( this, public_id, _.defaults( video_options.poster, DEFAULT_POSTER_OPTIONS))
    else
      video_options.poster = cloudinary_url.call( this, public_id, _.defaults( options, DEFAULT_POSTER_OPTIONS))
    if !video_options.poster
      delete video_options.poster
    poster = video_options.poster # TODO handle video attributes

    multi_source = _.isArray(source_types) and source_types.length > 1
    source = public_id
    if !multi_source
      source = source + '.' + build_array(source_types)[0]
    src = @url( source, video_options)
    if !multi_source
      video_options.src = src
    video_options.poster = poster # TODO handle video attributes
    html = '<video ' + html_attrs(video_options) + '>'
    if multi_source
      i = 0
      while i < source_types.length
        source_type = source_types[i]
        transformation = source_transformation[source_type] or {}
        src = cloudinary_url.call( this, source + '.' +
            source_type,
            _.merge({ resource_type: 'video' },
                      _.cloneDeep(options),
                      _.cloneDeep(transformation)))
        video_type = if source_type == 'ogv' then 'ogg' else source_type
        mime_type = 'video/' + video_type
        html = html + '<source ' + html_attrs(
            src: src
            type: mime_type) + '>'
        i++
    html = html + fallback
    html = html + '</video>'
    html
  sprite_css: (public_id, options) ->
    options = _.merge({ type: 'sprite' }, options)
    if !public_id.match(/.css$/)
      options.format = 'css'
    @url public_id, options
  responsive: (options) ->
    responsive_config = _.merge(responsive_config or {}, options)
    $('img.cld-responsive, img.cld-hidpi').cloudinary_update responsive_config
    responsive_resize = get_config('responsive_resize', responsive_config, true)
    if responsive_resize and !responsive_resize_initialized
      responsive_config.resizing = responsive_resize_initialized = true
      timeout = null
      $(window).on 'resize', ->
        debounce = get_config('responsive_debounce', responsive_config, 100)

        reset = ->
          if timeout
            clearTimeout timeout
            timeout = null
          return

        run = ->
          $('img.cld-responsive').cloudinary_update responsive_config
          return

        wait = ->
          reset()
          setTimeout (->
            reset()
            run()
            return
          ), debounce
          return

        if debounce
          wait()
        else
          run()
        return
    return
  calc_stoppoint: (element, width) ->
    stoppoints = $(element).data('stoppoints') or @config().stoppoints or default_stoppoints
    if typeof stoppoints == 'function'
      return stoppoints(width)
    if typeof stoppoints == 'string'
      stoppoints = _.map(stoppoints.split(','), (val) ->
        parseInt val
      )
    closest_above stoppoints, width
  device_pixel_ratio: ->
    dpr = window.devicePixelRatio or 1
    dpr_string = device_pixel_ratio_cache[dpr]
    if !dpr_string
      # Find closest supported DPR (to work correctly with device zoom)
      dpr_used = closest_above(@supported_dpr_values, dpr)
      dpr_string = dpr_used.toString()
      if dpr_string.match(/^\d+$/)
        dpr_string += '.0'
      device_pixel_ratio_cache[dpr] = dpr_string
    dpr_string
  supported_dpr_values: [
    0.75
    1.0
    1.3
    1.5
    2.0
    3.0
  ]

  default_stoppoints = (width) ->
    10 * Math.ceil(width / 10)
  closest_above = (list, value) ->
    i = list.length - 2
    while i >= 0 and list[i] >= value
      i--
    list[i + 1]

  # Produce a number between 1 and 5 to be used for cdn sub domains designation
  cdn_subdomain_number = (public_id)->
    crc32(public_id) % 5 + 1

  #  * cdn_subdomain - Boolean (default: false). Whether to automatically build URLs with multiple CDN sub-domains. See this blog post for more details.
  #  * private_cdn - Boolean (default: false). Should be set to true for Advanced plan's users that have a private CDN distribution.
  #  * secure_distribution - The domain name of the CDN distribution to use for building HTTPS URLs. Relevant only for Advanced plan's users that have a private CDN distribution.
  #  * cname - Custom domain name to use for building HTTP URLs. Relevant only for Advanced plan's users that have a private CDN distribution and a custom CNAME.
  #  * secure - Boolean (default: false). Force HTTPS URLs of images even if embedded in non-secure HTTP pages.
  cloudinary_url_prefix = (public_id, options) ->
    return '/res'+options.cloud_name if options.cloud_name?.indexOf("/")==0

    # defaults
    protocol = "http://"
    cdn_part = ""
    subdomain = "res"
    host = ".cloudinary.com"
    path = "/" + options.cloud_name

    # modifications
    if options.protocol
      protocol = options.protocol + '//'
    else if window?.location?.protocol == 'file:'
      protocol = 'file://'

    if options.private_cdn
      cdn_part = options.cloud_name + "-"
      path = ""

    if options.cdn_subdomain
      subdomain = "res-" + cdn_subdomain_number(public_id)

    if options.secure
      protocol = "https://"
      subdomain = "res" if options.secure_cdn_subdomain == false
      if options.secure_distribution? &&
         options.secure_distribution != OLD_AKAMAI_SHARED_CDN &&
         options.secure_distribution != SHARED_CDN
        cdn_part = ""
        subdomain = ""
        host = options.secure_distribution

    else if options.cname
      protocol = "http://"
      cdn_part = ""
      subdomain = if options.cdn_subdomain then 'a'+((crc32(public_id)%5)+1)+'.' else ''
      host = options.cname
#      path = ""

    [protocol, cdn_part, subdomain, host, path].join("")

  join_pair = (key, value) ->
    if !value
      undefined
    else if value == true
      key
    else
      key + '="' + value + '"'

  ###*
  # combine key and value from the `attr` to generate an HTML tag attributes string.
  # `Transformation::toHtmlTagOptions` is used to filter out transformation and configuration keys.
  # @param {Object} attr
  # @return {String} the attributes in the format `'key1="value1" key2="value2"'`
  ###
  html_attrs = (attrs) ->
    attrs = new Transformation(_.clone(attrs)).toHtmlTagOptions()
    pairs = _.map(attrs, (value, key) ->
      join_pair key, value
    )
    pairs.sort()
    pairs.filter((pair) ->
      pair
    ).join ' '

  unsigned_upload_tag = (upload_preset, upload_params, options) ->
    $('<input/>').attr(
      type: 'file'
      name: 'file').unsigned_cloudinary_upload upload_preset, upload_params, options

if module?.exports
#On a server
  exports.Cloudinary = Cloudinary
else
#On a client
  window.Cloudinary = Cloudinary

if window.jQuery?
  window.jQuery.cloudinary = new Cloudinary()
class HtmlTag extends Transformation
  constructor: (@name, @public_id, options={})->
    super(options)
  content: ()->
    ""
  openTag: ()->
    "<#{@name} #{_.compact(@attributes()).join(" ")}>"
  attributes: ()->
    for name, value of @toHtmlTagOptions() when value?
      if value == true
        name
      else
        "#{name}=\"#{value}\""
  closeTag:()->
    "</#{@name}>"
  content: ()->
    ""
  toHtml: ()->
    @openTag() +@content()+ @closeTag()

class ImageTag extends HtmlTag
  constructor: (@public_id, options={})->
    super("img", @public_id, options)
  toHtml: ()->
    @openTag()

class VideoTag extends HtmlTag
  DEFAULT_VIDEO_SOURCE_TYPES = ['webm', 'mp4', 'ogv']
  DEFAULT_POSTER_OPTIONS = { format: 'jpg', resource_type: 'video' }

  constructor: (@public_id, options={})->
    super("video", @public_id, options)
    @whitelist.push("source_transformation", "source_types", "poster")
  source_transformation: (value)-> @transformationParam value, "source_transformation"
  source_types: (value)->     @arrayParam value, "source_types"
  poster: (value)-> @param value, "poster"
  content: ()->
    source_types = @getValue("source_types") || Cloudinary.DEFAULT_VIDEO_SOURCE_TYPES
  toHtmlTagOptions: ()->
    super()["src"] = new Cloudinary(@options).url()

if module?.exports
#On a server
  exports.Cloudinary ?= {}
  exports.Cloudinary.ImageTag = ImageTag
  exports.Cloudinary.VideoTag = VideoTag
else
#On a client
  window.Cloudinary.ImageTag  = ImageTag
  window.Cloudinary.VideoTag  = VideoTag

# Footer for the cloudinary.coffee file

`
}));
`