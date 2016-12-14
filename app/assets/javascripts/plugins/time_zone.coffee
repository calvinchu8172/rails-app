# set timezone, require js-cookie, moment, moment-timezone
window.set_time_zone = ->
  Cookies.set('time_zone', moment.tz.guess(), { expires: 365, path: '/' });
