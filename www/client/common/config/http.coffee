angular.module 'online-swiss-knife.common'
.config ($httpProvider) ->
  $httpProvider.interceptors.push 'authHttpResponseInterceptor'
