<!doctype html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <meta name="csrf-token" value="{{ csrf_token() }}"/>
    <meta name="google-site-verification" content="sRbr0-NS6TYhTddR1uovzAzBeXN1d7kJGpA0zFYQEL0" />

    @if(is_null($data))
        <link data-vue-meta="1" rel="icon" href="https://undangabi.com/images/icon.png">
        <title>UndangAbi | Platform Undangan Digital</title>
    @else
        @if($data['cover'])
            <link data-vue-meta="1" rel="icon" href="https://undangabi.com/contents/invitations/thumbnails/{{ $data['cover'] }}">
            <meta data-vue-meta="1" property="image" itemprop="image primaryImageOfPage" content="https://undangabi.com/contents/invitations/thumbnails/{{ $data['cover'] }}">
        @endif

        @if($data['category_id'] == 1)
            <title>The Wedding Of : {{ $data['title'] }}</title>
            <meta data-vue-meta="1" property="title" content="The Wedding Of : {{ $data['title'] }}">
            <meta data-vue-meta="1" property="og:title" content="The Wedding Of : {{ $data['title'] }}">
            <meta data-vue-meta="1" property="twitter:title" content="The Wedding Of : {{ $data['title'] }}">
        @elseif($data['category_id'] == 8)
            <title>The Engagement Of : {{ $data['title'] }}</title>
            <meta data-vue-meta="1" property="title" content="The Engagement Of : {{ $data['title'] }}">
            <meta data-vue-meta="1" property="og:title" content="The Engagement Of : {{ $data['title'] }}">
            <meta data-vue-meta="1" property="twitter:title" content="The Engagement Of : {{ $data['title'] }}">
        @elseif($data['category_id'] == 9)
            <title>Walimatul Khitan : {{ $data['title'] }}</title>
            <meta data-vue-meta="1" property="title" content="Walimatul Khitan : {{ $data['title'] }}">
            <meta data-vue-meta="1" property="og:title" content="Walimatul Khitan : {{ $data['title'] }}">
            <meta data-vue-meta="1" property="twitter:title" content="Walimatul Khitan : {{ $data['title'] }}">
        @else
            <title>Undangan Acara : {{ $data['title'] }}</title>
            <meta data-vue-meta="1" property="title" content="Undangan Acara : {{ $data['title'] }}">
            <meta data-vue-meta="1" property="og:title" content="Undangan Acara : {{ $data['title'] }}">
            <meta data-vue-meta="1" property="twitter:title" content="Undangan Acara : {{ $data['title'] }}">
        @endif

        @if($data['cover'])
            <meta data-vue-meta="1" property="image" itemprop="image primaryImageOfPage" content="https://undangabi.com/contents/invitations/thumbnails/{{ $data['cover'] }}">
            <meta data-vue-meta="1" property="og:image" itemprop="image primaryImageOfPage" content="https://undangabi.com/contents/invitations/thumbnails/{{ $data['cover'] }}">
            <meta data-vue-meta="1" property="twitter:image" itemprop="image primaryImageOfPage" content="https://undangabi.com/contents/invitations/thumbnails/{{ $data['cover'] }}">
        @endif

        <!-- Default -->
        <meta data-vue-meta="1" property="site_name" content="UndangAbi">
        <meta data-vue-meta="1" property="type" content="website">
        <meta data-vue-meta="1" property="url" content="https://undangabi.com/{{ $data['short-link'] }}">
        <meta data-vue-meta="1" property="description" content="{{ $data['date'] }}">

        <!-- Open Graph / Facebook -->
        <meta data-vue-meta="1" property="og:site_name" content="UndangAbi">
        <meta data-vue-meta="1" property="og:type" content="website">
        <meta data-vue-meta="1" property="og:url" content="https://undangabi.com/{{ $data['short-link'] }}">
        <meta data-vue-meta="1" property="og:description" content="{{ $data['date'] }}">

        <!-- Twitter -->
        <meta data-vue-meta="1" property="twitter:site_name" content="UndangAbi">
        <meta data-vue-meta="1" property="twitter:type" content="website">
        <meta data-vue-meta="1" property="twitter:card" content="summary_large_image">
        <meta data-vue-meta="1" property="twitter:url" content="https://undangabi.com/{{ $data['short-link'] }}">
        <meta data-vue-meta="1" property="twitter:description" content="{{ $data['date'] }}">
    @endif

    <link href="https://fonts.googleapis.com/css?family=Nunito:200,600" rel="stylesheet" type="text/css">
    <link href="{{ mix('css/app.css') }}" type="text/css" rel="stylesheet"/>
    <style>
        .bg-light {
            background-color: #eae9e9 !important;
        }
    </style>
    <script>
        (function(w,d,s,l,i){w[l]=w[l]||[];w[l].push(
            {'gtm.start': new Date().getTime(),event:'gtm.js'});
            var f=d.getElementsByTagName(s)[0],j=d.createElement(s),dl=l!='dataLayer'?'&l='+l:'';
            j.async=true;
            j.src='https://www.googletagmanager.com/gtm.js?id='+i+dl;
            f.parentNode.insertBefore(j,f);
        })(window,document,'script','dataLayer','GTM-PWTN22G');
    </script>
</head>
<body>
    <div id="app" />
    <script src="{{ mix('js/app.js') }}?v=1.0.14" type="text/javascript"></script>
    <noscript><iframe src="https://www.googletagmanager.com/ns.html?id=GTM-PWTN22G" height="0" width="0" style="display:none;visibility:hidden"></iframe></noscript>
</body>
</html>
