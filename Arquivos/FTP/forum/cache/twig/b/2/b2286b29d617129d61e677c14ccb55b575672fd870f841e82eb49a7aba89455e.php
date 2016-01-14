<?php

/* overall_header.html */
class __TwigTemplate_b2286b29d617129d61e677c14ccb55b575672fd870f841e82eb49a7aba89455e extends Twig_Template
{
    public function __construct(Twig_Environment $env)
    {
        parent::__construct($env);

        $this->parent = false;

        $this->blocks = array(
        );
    }

    protected function doDisplay(array $context, array $blocks = array())
    {
        // line 1
        echo "<!DOCTYPE html>
<html dir=\"";
        // line 2
        echo (isset($context["S_CONTENT_DIRECTION"]) ? $context["S_CONTENT_DIRECTION"] : null);
        echo "\" lang=\"";
        echo (isset($context["S_USER_LANG"]) ? $context["S_USER_LANG"] : null);
        echo "\">
<head>
<meta charset=\"";
        // line 4
        echo (isset($context["S_CONTENT_ENCODING"]) ? $context["S_CONTENT_ENCODING"] : null);
        echo "\">
<meta name=\"author\" content=\"SiteSplat www.sitesplat.com\">
<meta name=\"designer\" content=\"SiteSplat www.sitesplat.com\">
<meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\"><!-- Set the viewport width to device width for mobile -->
<meta name=\"Description\" content=\"\"><!-- Set Your forum description here inside the \"\" tag -->
<meta name=\"Keywords\" content=\"\"><!-- Set Your forum keywords here inside the \"\" tag and make sure they are separated by a comma -->
<meta name=\"application-name\" content=\"FLATBOOTS\"><!-- WIN8 Tiles setup forum name -->
<meta name=\"msapplication-TileColor\" content=\"#ffffff\"><!-- WIN8 Tiles color -->
<!-- Place favicon.ico and apple-touch-icon.png in the root directory -->
";
        // line 13
        echo (isset($context["META"]) ? $context["META"] : null);
        echo "
<title>";
        // line 14
        if ((isset($context["UNREAD_NOTIFICATIONS_COUNT"]) ? $context["UNREAD_NOTIFICATIONS_COUNT"] : null)) {
            echo "&#40;";
            echo (isset($context["UNREAD_NOTIFICATIONS_COUNT"]) ? $context["UNREAD_NOTIFICATIONS_COUNT"] : null);
            echo "&#41;&nbsp;";
        }
        if (( !(isset($context["S_VIEWTOPIC"]) ? $context["S_VIEWTOPIC"] : null) &&  !(isset($context["S_VIEWFORUM"]) ? $context["S_VIEWFORUM"] : null))) {
            echo (isset($context["SITENAME"]) ? $context["SITENAME"] : null);
            echo "&nbsp;&#45;&nbsp;";
        }
        if ((isset($context["S_IN_MCP"]) ? $context["S_IN_MCP"] : null)) {
            echo $this->env->getExtension('phpbb')->lang("MCP");
            echo "&nbsp;&#45;&nbsp;";
        } elseif ((isset($context["S_IN_UCP"]) ? $context["S_IN_UCP"] : null)) {
            echo $this->env->getExtension('phpbb')->lang("UCP");
            echo "&nbsp;&#45;&nbsp;";
        }
        echo (isset($context["PAGE_TITLE"]) ? $context["PAGE_TITLE"] : null);
        if (((isset($context["S_VIEWTOPIC"]) ? $context["S_VIEWTOPIC"] : null) || (isset($context["S_VIEWFORUM"]) ? $context["S_VIEWFORUM"] : null))) {
            echo "&nbsp;&#45;&nbsp;";
            echo (isset($context["SITENAME"]) ? $context["SITENAME"] : null);
        }
        echo "</title>
";
        // line 15
        if ((isset($context["S_ENABLE_FEEDS"]) ? $context["S_ENABLE_FEEDS"] : null)) {
            // line 16
            echo "\t";
            if ((isset($context["S_ENABLE_FEEDS_OVERALL"]) ? $context["S_ENABLE_FEEDS_OVERALL"] : null)) {
                echo "<link rel=\"alternate\" type=\"application/atom+xml\" title=\"";
                echo $this->env->getExtension('phpbb')->lang("FEED");
                echo " - ";
                echo (isset($context["SITENAME"]) ? $context["SITENAME"] : null);
                echo "\" href=\"";
                echo (isset($context["U_FEED"]) ? $context["U_FEED"] : null);
                echo "\">";
            }
            // line 17
            echo "\t";
            if ((isset($context["S_ENABLE_FEEDS_NEWS"]) ? $context["S_ENABLE_FEEDS_NEWS"] : null)) {
                echo "<link rel=\"alternate\" type=\"application/atom+xml\" title=\"";
                echo $this->env->getExtension('phpbb')->lang("FEED");
                echo " - ";
                echo $this->env->getExtension('phpbb')->lang("FEED_NEWS");
                echo "\" href=\"";
                echo (isset($context["U_FEED"]) ? $context["U_FEED"] : null);
                echo "?mode=news\">";
            }
            // line 18
            echo "\t";
            if ((isset($context["S_ENABLE_FEEDS_FORUMS"]) ? $context["S_ENABLE_FEEDS_FORUMS"] : null)) {
                echo "<link rel=\"alternate\" type=\"application/atom+xml\" title=\"";
                echo $this->env->getExtension('phpbb')->lang("FEED");
                echo " - ";
                echo $this->env->getExtension('phpbb')->lang("ALL_FORUMS");
                echo "\" href=\"";
                echo (isset($context["U_FEED"]) ? $context["U_FEED"] : null);
                echo "?mode=forums\">";
            }
            // line 19
            echo "\t";
            if ((isset($context["S_ENABLE_FEEDS_TOPICS"]) ? $context["S_ENABLE_FEEDS_TOPICS"] : null)) {
                echo "<link rel=\"alternate\" type=\"application/atom+xml\" title=\"";
                echo $this->env->getExtension('phpbb')->lang("FEED");
                echo " - ";
                echo $this->env->getExtension('phpbb')->lang("FEED_TOPICS_NEW");
                echo "\" href=\"";
                echo (isset($context["U_FEED"]) ? $context["U_FEED"] : null);
                echo "?mode=topics\">";
            }
            // line 20
            echo "\t";
            if ((isset($context["S_ENABLE_FEEDS_TOPICS_ACTIVE"]) ? $context["S_ENABLE_FEEDS_TOPICS_ACTIVE"] : null)) {
                echo "<link rel=\"alternate\" type=\"application/atom+xml\" title=\"";
                echo $this->env->getExtension('phpbb')->lang("FEED");
                echo " - ";
                echo $this->env->getExtension('phpbb')->lang("FEED_TOPICS_ACTIVE");
                echo "\" href=\"";
                echo (isset($context["U_FEED"]) ? $context["U_FEED"] : null);
                echo "?mode=topics_active\">";
            }
            // line 21
            echo "\t";
            if (((isset($context["S_ENABLE_FEEDS_FORUM"]) ? $context["S_ENABLE_FEEDS_FORUM"] : null) && (isset($context["S_FORUM_ID"]) ? $context["S_FORUM_ID"] : null))) {
                echo "<link rel=\"alternate\" type=\"application/atom+xml\" title=\"";
                echo $this->env->getExtension('phpbb')->lang("FEED");
                echo " - ";
                echo $this->env->getExtension('phpbb')->lang("FORUM");
                echo " - ";
                echo (isset($context["FORUM_NAME"]) ? $context["FORUM_NAME"] : null);
                echo "\" href=\"";
                echo (isset($context["U_FEED"]) ? $context["U_FEED"] : null);
                echo "?f=";
                echo (isset($context["S_FORUM_ID"]) ? $context["S_FORUM_ID"] : null);
                echo "\">";
            }
            // line 22
            echo "\t";
            if (((isset($context["S_ENABLE_FEEDS_TOPIC"]) ? $context["S_ENABLE_FEEDS_TOPIC"] : null) && (isset($context["S_TOPIC_ID"]) ? $context["S_TOPIC_ID"] : null))) {
                echo "<link rel=\"alternate\" type=\"application/atom+xml\" title=\"";
                echo $this->env->getExtension('phpbb')->lang("FEED");
                echo " - ";
                echo $this->env->getExtension('phpbb')->lang("TOPIC");
                echo " - ";
                echo (isset($context["TOPIC_TITLE"]) ? $context["TOPIC_TITLE"] : null);
                echo "\" href=\"";
                echo (isset($context["U_FEED"]) ? $context["U_FEED"] : null);
                echo "?f=";
                echo (isset($context["S_FORUM_ID"]) ? $context["S_FORUM_ID"] : null);
                echo "&amp;t=";
                echo (isset($context["S_TOPIC_ID"]) ? $context["S_TOPIC_ID"] : null);
                echo "\">";
            }
            // line 23
        }
        // line 25
        echo "
";
        // line 26
        if ((isset($context["U_CANONICAL"]) ? $context["U_CANONICAL"] : null)) {
            // line 27
            echo "\t<link rel=\"canonical\" href=\"";
            echo (isset($context["U_CANONICAL"]) ? $context["U_CANONICAL"] : null);
            echo "\" />
";
        }
        // line 29
        echo "
<!-- Google free font here -->
<link href='//fonts.googleapis.com/css?family=Source+Sans+Pro:400,600' rel='stylesheet' type='text/css'>
<link href='//fonts.googleapis.com/css?family=Asap:700' rel='stylesheet' type='text/css'>

<!-- CSS files start here -->
<link href=\"";
        // line 35
        echo (isset($context["T_STYLESHEET_LINK"]) ? $context["T_STYLESHEET_LINK"] : null);
        echo "\" rel=\"stylesheet\">
";
        // line 36
        if ((isset($context["S_PLUPLOAD"]) ? $context["S_PLUPLOAD"] : null)) {
            // line 37
            echo "<link href=\"";
            echo (isset($context["T_THEME_PATH"]) ? $context["T_THEME_PATH"] : null);
            echo "/plupload.css?assets_version=";
            echo (isset($context["T_ASSETS_VERSION"]) ? $context["T_ASSETS_VERSION"] : null);
            echo "\" rel=\"stylesheet\">
";
        }
        // line 39
        // line 40
        echo "
";
        // line 41
        echo $this->getAttribute((isset($context["definition"]) ? $context["definition"] : null), "STYLESHEETS", array());
        echo "

<link href=\"";
        // line 43
        echo (isset($context["T_THEME_PATH"]) ? $context["T_THEME_PATH"] : null);
        echo "/basics.min.css\" rel=\"stylesheet\">
<!-- Remove the conditional below to use the custom CSS without FLATBOOTS Mini CMS Extension -->
";
        // line 45
        if ((isset($context["S_ALLOW_CUSTOMCSS"]) ? $context["S_ALLOW_CUSTOMCSS"] : null)) {
            // line 46
            echo "<link href=\"";
            echo (isset($context["T_THEME_PATH"]) ? $context["T_THEME_PATH"] : null);
            echo "/custom.css\" rel=\"stylesheet\">
";
        }
        // line 48
        echo "
<!-- CSS files stop here -->

";
        // line 51
        // line 52
        echo "
<!-- older scripts set started here after the headjs - cannot do this with phpbb31 due to ajax stuff -->
<script src=\"//cdnjs.cloudflare.com/ajax/libs/headjs/1.0.3/head.load.min.js\"></script>

</head>
<body data-spy=\"scroll\" data-target=\".scrollspy\" id=\"phpbb\" class=\"section-";
        // line 57
        echo (isset($context["SCRIPT_NAME"]) ? $context["SCRIPT_NAME"] : null);
        echo " ";
        echo (isset($context["S_CONTENT_DIRECTION"]) ? $context["S_CONTENT_DIRECTION"] : null);
        echo " ";
        echo (isset($context["BODY_CLASS"]) ? $context["BODY_CLASS"] : null);
        echo "\">
";
        // line 58
        // line 59
        echo "
 <header id=\"top\" class=\"navbar navbar-inverse navbar-static-top flat-nav\">
  <div class=\"container\">
    <div class=\"navbar-header\">
      <button data-target=\".flat-nav-collapse\" data-toggle=\"collapse\" type=\"button\" class=\"nav-tog lines-button x navbar-toggle neutro\">
\t   <span class=\"sr-only sr-nav\">";
        // line 64
        echo $this->env->getExtension('phpbb')->lang("TOGGLE_NAV");
        echo "</span>
        <span class=\"lines\"></span>
      </button>
\t  ";
        // line 67
        if ((isset($context["LOGO_IMAGE_EXIST"]) ? $context["LOGO_IMAGE_EXIST"] : null)) {
            // line 68
            echo "      \t<a class=\"navbar-brand\" href=\"";
            if ((isset($context["U_SITE_HOME"]) ? $context["U_SITE_HOME"] : null)) {
                echo (isset($context["U_SITE_HOME"]) ? $context["U_SITE_HOME"] : null);
            } else {
                echo (isset($context["U_INDEX"]) ? $context["U_INDEX"] : null);
            }
            echo "\"><img style=\"max-height: 60px; max-width:100%; margin-top: -20px;\" class=\"img-responsive\" src=\"";
            echo (isset($context["T_IMAGES_PATH"]) ? $context["T_IMAGES_PATH"] : null);
            echo "../ext/sitesplat/flatbootsminicms/images/logo/";
            echo (isset($context["LOGO_FILENAME"]) ? $context["LOGO_FILENAME"] : null);
            echo "\" alt=\"";
            echo (isset($context["LOGO_TEXT"]) ? $context["LOGO_TEXT"] : null);
            echo "\" /></a>
      ";
        } else {
            // line 70
            echo "      \t<a class=\"navbar-brand\" href=\"";
            if ((isset($context["U_SITE_HOME"]) ? $context["U_SITE_HOME"] : null)) {
                echo (isset($context["U_SITE_HOME"]) ? $context["U_SITE_HOME"] : null);
            } else {
                echo (isset($context["U_INDEX"]) ? $context["U_INDEX"] : null);
            }
            echo "\">";
            echo $this->env->getExtension('phpbb')->lang("FLATBOOTS");
            echo "</a>
      ";
        }
        // line 72
        echo "    </div>
\t ";
        // line 73
        $location = "addons/navigation.html";
        $namespace = false;
        if (strpos($location, '@') === 0) {
            $namespace = substr($location, 1, strpos($location, '/') - 1);
            $previous_look_up_order = $this->env->getNamespaceLookUpOrder();
            $this->env->setNamespaceLookUpOrder(array($namespace, '__main__'));
        }
        $this->loadTemplate("addons/navigation.html", "overall_header.html", 73)->display($context);
        if ($namespace) {
            $this->env->setNamespaceLookUpOrder($previous_look_up_order);
        }
        // line 74
        echo "  </div>
 </header>
    <div class=\"search-input search-input-fullscreen hidden-xs hidden-sm\">
\t   <form method=\"get\" id=\"search\" action=\"";
        // line 77
        echo (isset($context["U_SEARCH"]) ? $context["U_SEARCH"] : null);
        echo "\">
\t\t   <fieldset>
\t\t   <input name=\"keywords\" id=\"keywords\" type=\"text\" maxlength=\"128\" title=\"";
        // line 79
        echo $this->env->getExtension('phpbb')->lang("SEARCH_KEYWORDS");
        echo "\" placeholder=\"";
        echo $this->env->getExtension('phpbb')->lang("SEARCH");
        echo "\" value=\"\" autocomplete=\"off\"/>
\t\t   <div class=\"close\">&times;</div>
\t\t   ";
        // line 81
        echo (isset($context["S_SEARCH_HIDDEN_FIELDS"]) ? $context["S_SEARCH_HIDDEN_FIELDS"] : null);
        echo "
\t\t   </fieldset> 
        </form> 
    </div>

";
        // line 86
        if ( !(isset($context["HIDE_HEADER"]) ? $context["HIDE_HEADER"] : null)) {
            echo "\t\t
  ";
            // line 87
            if ((isset($context["IN_BADGE"]) ? $context["IN_BADGE"] : null)) {
                // line 88
                echo "   ";
                $location = "@sitesplat_badge/header_badge_teaser.html";
                $namespace = false;
                if (strpos($location, '@') === 0) {
                    $namespace = substr($location, 1, strpos($location, '/') - 1);
                    $previous_look_up_order = $this->env->getNamespaceLookUpOrder();
                    $this->env->setNamespaceLookUpOrder(array($namespace, '__main__'));
                }
                $this->loadTemplate("@sitesplat_badge/header_badge_teaser.html", "overall_header.html", 88)->display($context);
                if ($namespace) {
                    $this->env->setNamespaceLookUpOrder($previous_look_up_order);
                }
                // line 89
                echo "  ";
            } else {
                // line 90
                echo "   ";
                $location = "addons/header_teaser_body.html";
                $namespace = false;
                if (strpos($location, '@') === 0) {
                    $namespace = substr($location, 1, strpos($location, '/') - 1);
                    $previous_look_up_order = $this->env->getNamespaceLookUpOrder();
                    $this->env->setNamespaceLookUpOrder(array($namespace, '__main__'));
                }
                $this->loadTemplate("addons/header_teaser_body.html", "overall_header.html", 90)->display($context);
                if ($namespace) {
                    $this->env->setNamespaceLookUpOrder($previous_look_up_order);
                }
                // line 91
                echo "  ";
            }
        } else {
            // line 93
            echo "<div style=\"padding-top:30px;\" class=\"space-teaser\"></div>
";
        }
        // line 95
        echo "  
<div class=\"container\">
  <!-- start content -->
  <div id=\"content-forum\">

  ";
        // line 100
        // line 101
        echo "\t<div class=\"breadcrumb-line clearfix\">
\t\t<ul class=\"breadcrumb\">
\t\t";
        // line 103
        $value = " itemtype=\"http://data-vocabulary.org/Breadcrumb\" itemscope=\"\"";
        $context['definition']->set('MICRODATA', $value);
        // line 104
        echo "
\t\t  ";
        // line 105
        if ((isset($context["U_SITE_HOME"]) ? $context["U_SITE_HOME"] : null)) {
            // line 106
            echo "\t\t   <li ";
            echo $this->getAttribute((isset($context["definition"]) ? $context["definition"] : null), "MICRODATA", array());
            echo "><a href=\"";
            echo (isset($context["U_SITE_HOME"]) ? $context["U_SITE_HOME"] : null);
            echo "\" data-navbar-reference=\"home\" itemprop=\"url\"><span class=\"icon fa fa-home\"></span></a></li>
\t\t   <li ";
            // line 107
            echo $this->getAttribute((isset($context["definition"]) ? $context["definition"] : null), "MICRODATA", array());
            echo "><a href=\"";
            echo (isset($context["U_SITE_HOME"]) ? $context["U_SITE_HOME"] : null);
            echo "\" data-navbar-reference=\"home\" itemprop=\"url\">";
            echo $this->env->getExtension('phpbb')->lang("SITE_HOME");
            echo "</a></li>
\t\t  ";
        } else {
            // line 109
            echo "\t\t   <li ";
            echo $this->getAttribute((isset($context["definition"]) ? $context["definition"] : null), "MICRODATA", array());
            echo "><a href=\"";
            echo (isset($context["U_INDEX"]) ? $context["U_INDEX"] : null);
            echo "\" data-navbar-reference=\"index\" itemprop=\"url\"><span class=\"icon fa fa-home\"></span></a></li>
\t\t   <li ";
            // line 110
            echo $this->getAttribute((isset($context["definition"]) ? $context["definition"] : null), "MICRODATA", array());
            echo "><a href=\"";
            echo (isset($context["U_INDEX"]) ? $context["U_INDEX"] : null);
            echo "\" data-navbar-reference=\"index\" itemprop=\"url\">";
            echo $this->env->getExtension('phpbb')->lang("INDEX");
            echo "</a></li>
\t\t  ";
        }
        // line 112
        echo "\t\t  
        ";
        // line 113
        // line 114
        echo "\t\t  ";
        $context['_parent'] = (array) $context;
        $context['_seq'] = twig_ensure_traversable($this->getAttribute((isset($context["loops"]) ? $context["loops"] : null), "navlinks", array()));
        foreach ($context['_seq'] as $context["_key"] => $context["navlinks"]) {
            // line 115
            echo "\t\t   <li ";
            echo $this->getAttribute((isset($context["definition"]) ? $context["definition"] : null), "MICRODATA", array());
            echo "><a itemprop=\"url\" href=\"";
            echo $this->getAttribute($context["navlinks"], "U_VIEW_FORUM", array());
            echo "\"";
            if ($this->getAttribute($context["navlinks"], "MICRODATA", array())) {
                echo " ";
                echo $this->getAttribute($context["navlinks"], "MICRODATA", array());
            }
            echo ">";
            echo $this->getAttribute($context["navlinks"], "FORUM_NAME", array());
            echo "</a></li>\t\t 
\t\t ";
        }
        $_parent = $context['_parent'];
        unset($context['_seq'], $context['_iterated'], $context['_key'], $context['navlinks'], $context['_parent'], $context['loop']);
        $context = array_intersect_key($context, $_parent) + $_parent;
        // line 117
        echo "\t\t";
        echo "  
\t    
\t\t</ul>
\t\t";
        // line 120
        if (((isset($context["S_USER_LOGGED_IN"]) ? $context["S_USER_LOGGED_IN"] : null) && (((isset($context["SCRIPT_NAME"]) ? $context["SCRIPT_NAME"] : null) == "viewforum") || ((isset($context["SCRIPT_NAME"]) ? $context["SCRIPT_NAME"] : null) == "viewtopic")))) {
            // line 121
            echo "\t\t<ul class=\"breadcrumb-buttons visible-xxs\">
\t\t    <li>
\t\t\t  <a href=\"#\" title=\"\" data-toggle=\"modal\" data-target=\"#BreadcrumbMap\">
\t\t\t   <i class=\"icon fa fa-sitemap\"></i>
\t\t\t  </a>
\t\t   </li>
\t\t</ul>
\t\t";
        }
        // line 129
        echo "\t</div>
\t
    ";
        // line 131
        // line 132
        echo "\t
\t<div id=\"page-body\">
\t
\t";
        // line 135
        if ((((isset($context["S_BOARD_DISABLED"]) ? $context["S_BOARD_DISABLED"] : null) && (isset($context["S_USER_LOGGED_IN"]) ? $context["S_USER_LOGGED_IN"] : null)) && ((isset($context["U_MCP"]) ? $context["U_MCP"] : null) || (isset($context["U_ACP"]) ? $context["U_ACP"] : null)))) {
            // line 136
            echo "\t<div class=\"alert alert-warning fade in\">
\t\t<button data-dismiss=\"alert\" class=\"close\"><span class=\"awe-remove-circle\"></span></button>
\t\t<i class=\"fa fa-info\"></i>&nbsp;<strong>";
            // line 138
            echo $this->env->getExtension('phpbb')->lang("INFORMATION");
            echo $this->env->getExtension('phpbb')->lang("COLON");
            echo "</strong>&nbsp;";
            echo $this->env->getExtension('phpbb')->lang("BOARD_DISABLED");
            echo "
\t</div>
\t";
        }
        // line 141
        echo "\t
    ";
        // line 142
    }

    public function getTemplateName()
    {
        return "overall_header.html";
    }

    public function isTraitable()
    {
        return false;
    }

    public function getDebugInfo()
    {
        return array (  488 => 142,  485 => 141,  476 => 138,  472 => 136,  470 => 135,  465 => 132,  464 => 131,  460 => 129,  450 => 121,  448 => 120,  442 => 117,  424 => 115,  419 => 114,  418 => 113,  415 => 112,  406 => 110,  399 => 109,  390 => 107,  383 => 106,  381 => 105,  378 => 104,  375 => 103,  371 => 101,  370 => 100,  363 => 95,  359 => 93,  355 => 91,  342 => 90,  339 => 89,  326 => 88,  324 => 87,  320 => 86,  312 => 81,  305 => 79,  300 => 77,  295 => 74,  283 => 73,  280 => 72,  268 => 70,  252 => 68,  250 => 67,  244 => 64,  237 => 59,  236 => 58,  228 => 57,  221 => 52,  220 => 51,  215 => 48,  209 => 46,  207 => 45,  202 => 43,  197 => 41,  194 => 40,  193 => 39,  185 => 37,  183 => 36,  179 => 35,  171 => 29,  165 => 27,  163 => 26,  160 => 25,  158 => 23,  141 => 22,  126 => 21,  115 => 20,  104 => 19,  93 => 18,  82 => 17,  71 => 16,  69 => 15,  45 => 14,  41 => 13,  29 => 4,  22 => 2,  19 => 1,);
    }
}
