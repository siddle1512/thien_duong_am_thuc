<style type="text/css">
    body{
        margin-top:20px;
        background:#f5f5f5;
    }
    /* ===========
       Profile
     =============*/
    .card-box {
        padding: 20px;
        box-shadow: 0 2px 15px 0 rgba(0, 0, 0, 0.06), 0 2px 0 0 rgba(0, 0, 0, 0.02);
        -webkit-border-radius: 5px;
        border-radius: 5px;
        -moz-border-radius: 5px;
        background-clip: padding-box;
        margin-bottom: 20px;
        background-color: #ffffff;
    }
    .header-title {
        text-transform: uppercase;
        font-size: 15px;
        font-weight: 600;
        letter-spacing: 0.04em;
        line-height: 16px;
        margin-bottom: 8px;
    }
    .social-links li a {
        -webkit-border-radius: 50%;
        background: #EFF0F4;
        border-radius: 50%;
        color: #7A7676;
        display: inline-block;
        height: 30px;
        line-height: 30px;
        text-align: center;
        width: 30px;
    }

    /* ===========
       Gallery
     =============*/
    .portfolioFilter a {
        -moz-box-shadow: 0px 1px 2px 0px rgba(0, 0, 0, 0.1);
        -moz-transition: all 0.3s ease-out;
        -ms-transition: all 0.3s ease-out;
        -o-transition: all 0.3s ease-out;
        -webkit-box-shadow: 0px 1px 2px 0px rgba(0, 0, 0, 0.1);
        -webkit-transition: all 0.3s ease-out;
        box-shadow: 0px 1px 2px 0px rgba(0, 0, 0, 0.1);
        color: #333333;
        padding: 5px 10px;
        display: inline-block;
        transition: all 0.3s ease-out;
    }
    .portfolioFilter a:hover {
        background-color: #228bdf;
        color: #ffffff;
    }
    .portfolioFilter a.current {
        background-color: #228bdf;
        color: #ffffff;
    }
    .thumb {
        background-color: #ffffff;
        border-radius: 3px;
        box-shadow: 0 1px 1px 0 rgba(0, 0, 0, 0.1);
        margin-top: 30px;
        padding-bottom: 10px;
        padding-left: 10px;
        padding-right: 10px;
        padding-top: 10px;
        width: 100%;
    }
    .thumb-img {
        border-radius: 2px;
        overflow: hidden;
        width: 100%;
    }
    .gal-detail h4 {
        margin: 16px auto 10px auto;
        width: 80%;
        white-space: nowrap;
        display: block;
        overflow: hidden;
        text-overflow: ellipsis;
    }
    .gal-detail .ga-border {
        height: 3px;
        width: 40px;
        background-color: #228bdf;
        margin: 10px auto;
    }




    .tabs-vertical-env .tab-content {
        background: #ffffff;
        display: table-cell;
        margin-bottom: 30px;
        padding: 30px;
        vertical-align: top;
    }
    .tabs-vertical-env .nav.tabs-vertical {
        display: table-cell;
        min-width: 120px;
        vertical-align: top;
        width: 150px;
    }
    .tabs-vertical-env .nav.tabs-vertical li.active > a {
        background-color: #ffffff;
        border: 0;
    }
    .tabs-vertical-env .nav.tabs-vertical li > a {
        color: #333333;
        text-align: center;
        font-family: 'Roboto', sans-serif;
        font-weight: 500;
        white-space: nowrap;
    }
    .nav.nav-tabs > li.active > a {
        background-color: #ffffff;
        border: 0;
    }
    .nav.nav-tabs > li > a {
        background-color: transparent;
        border-radius: 0;
        border: none;
        color: #333333 !important;
        cursor: pointer;
        line-height: 50px;
        font-weight: 500;
        padding-left: 20px;
        padding-right: 20px;
        font-family: 'Roboto', sans-serif;
    }
    .nav.nav-tabs > li > a:hover {
        color: #228bdf !important;
    }
    .nav.tabs-vertical > li > a {
        background-color: transparent;
        border-radius: 0;
        border: none;
        color: #333333 !important;
        cursor: pointer;
        line-height: 50px;
        padding-left: 20px;
        padding-right: 20px;
    }
    .nav.tabs-vertical > li > a:hover {
        color: #228bdf !important;
    }
    .tab-content {
        box-shadow: 0 1px 1px rgba(0, 0, 0, 0.05);
        color: #777777;
    }
    .nav.nav-tabs > li:last-of-type a {
        margin-right: 0px;
    }
    .nav.nav-tabs {
        border-bottom: 0;
        box-shadow: 0 1px 1px rgba(0, 0, 0, 0.05);
    }
    .navtab-custom li {
        margin-bottom: -2px;
    }
    .navtab-custom li a {
        border-top: 2px solid transparent !important;
    }
    .navtab-custom li.active a {
        border-top: 2px solid #228bdf !important;
    }
    .nav-tab-left.navtab-custom li a {
        border: none !important;
        border-left: 2px solid transparent !important;
    }
    .nav-tab-left.navtab-custom li.active a {
        border-left: 2px solid #228bdf !important;
    }
    .nav-tab-right.navtab-custom li a {
        border: none !important;
        border-right: 2px solid transparent !important;
    }
    .nav-tab-right.navtab-custom li.active a {
        border-right: 2px solid #228bdf !important;
    }
    .nav-tabs.nav-justified > .active > a,
    .nav-tabs.nav-justified > .active > a:hover,
    .nav-tabs.nav-justified > .active > a:focus,
    .tabs-vertical-env .nav.tabs-vertical li.active > a {
        border: none;
    }
    .nav-tabs > li.active > a,
    .nav-tabs > li.active > a:focus,
    .nav-tabs > li.active > a:hover,
    .tabs-vertical > li.active > a,
    .tabs-vertical > li.active > a:focus,
    .tabs-vertical > li.active > a:hover {
        color: #228bdf !important;
    }

    .nav.nav-tabs + .tab-content {
        background: #ffffff;
        margin-bottom: 20px;
        padding: 20px;
    }
    .progress.progress-sm .progress-bar {
        font-size: 8px;
        line-height: 5px;
    }
</style>