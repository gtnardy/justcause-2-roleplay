<?php

/* viewforum_body.html */
class __TwigTemplate_79ccec9f8006af490858b4bd545e2471a7d637939cc4e9291e47fd82b9a6f52e extends Twig_Template
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
        $location = "overall_header.html";
        $namespace = false;
        if (strpos($location, '@') === 0) {
            $namespace = substr($location, 1, strpos($location, '/') - 1);
            $previous_look_up_order = $this->env->getNamespaceLookUpOrder();
            $this->env->setNamespaceLookUpOrder(array($namespace, '__main__'));
        }
        $this->loadTemplate("overall_header.html", "viewforum_body.html", 1)->display($context);
        if ($namespace) {
            $this->env->setNamespaceLookUpOrder($previous_look_up_order);
        }
        // line 2
        echo "
";
        // line 3
        // line 4
        echo "<div class=\"side-segment\"><h3>";
        echo "<a href=\"";
        echo (isset($context["U_VIEW_FORUM"]) ? $context["U_VIEW_FORUM"] : null);
        echo "\">";
        echo (isset($context["FORUM_NAME"]) ? $context["FORUM_NAME"] : null);
        echo "</a>";
        echo "</h3></div> 
";
        // line 5
        // line 6
        echo "
";
        // line 7
        if ((((isset($context["FORUM_DESC"]) ? $context["FORUM_DESC"] : null) || (isset($context["MODERATORS"]) ? $context["MODERATORS"] : null)) || (isset($context["U_MCP"]) ? $context["U_MCP"] : null))) {
            // line 8
            echo "<div>
\t<!-- NOTE: remove the style=\"display: none\" when you want to have the forum description on the forum body -->
\t";
            // line 10
            if ((isset($context["FORUM_DESC"]) ? $context["FORUM_DESC"] : null)) {
                echo "<div style=\"display: none;\">";
                echo (isset($context["FORUM_DESC"]) ? $context["FORUM_DESC"] : null);
                echo "<br /></div>";
            }
            // line 11
            echo "\t";
            if ((isset($context["MODERATORS"]) ? $context["MODERATORS"] : null)) {
                echo "<p><strong>";
                if ((isset($context["S_SINGLE_MODERATOR"]) ? $context["S_SINGLE_MODERATOR"] : null)) {
                    echo $this->env->getExtension('phpbb')->lang("MODERATOR");
                } else {
                    echo $this->env->getExtension('phpbb')->lang("MODERATORS");
                }
                echo ":</strong> ";
                echo (isset($context["MODERATORS"]) ? $context["MODERATORS"] : null);
                echo "</p>";
            }
            // line 12
            echo "</div>
";
        }
        // line 14
        echo "
";
        // line 15
        if ((isset($context["S_FORUM_RULES"]) ? $context["S_FORUM_RULES"] : null)) {
            // line 16
            echo "<div class=\"alert alert-info fade in\">
\t<button class=\"close\" data-dismiss=\"alert\"><span class=\"awe-remove-circle\"></span></button>
\t";
            // line 18
            if ((isset($context["U_FORUM_RULES"]) ? $context["U_FORUM_RULES"] : null)) {
                // line 19
                echo "\t\t\t<a href=\"";
                echo (isset($context["U_FORUM_RULES"]) ? $context["U_FORUM_RULES"] : null);
                echo "\"><i class=\"fa fa-link fa-rotate-90\"></i>&nbsp;";
                echo $this->env->getExtension('phpbb')->lang("FORUM_RULES");
                echo "</a>
\t\t";
            } else {
                // line 20
                echo " 
\t\t<strong>";
                // line 21
                echo $this->env->getExtension('phpbb')->lang("FORUM_RULES");
                echo $this->env->getExtension('phpbb')->lang("COLON");
                echo "</strong>&nbsp;";
                echo (isset($context["FORUM_RULES"]) ? $context["FORUM_RULES"] : null);
                echo "
\t\t";
            }
            // line 23
            echo "</div>
";
        }
        // line 25
        echo "
";
        // line 26
        if ((isset($context["S_HAS_SUBFORUM"]) ? $context["S_HAS_SUBFORUM"] : null)) {
            // line 27
            if (( !(isset($context["S_IS_BOT"]) ? $context["S_IS_BOT"] : null) && (isset($context["U_MARK_FORUMS"]) ? $context["U_MARK_FORUMS"] : null))) {
                // line 28
                echo "      <ul class=\"pagination pagination-sm pull-right\">
\t    <li><a href=\"";
                // line 29
                echo (isset($context["U_MARK_FORUMS"]) ? $context["U_MARK_FORUMS"] : null);
                echo "\" class=\"mark-read\" data-ajax=\"mark_forums_read\">";
                echo $this->env->getExtension('phpbb')->lang("MARK_SUBFORUMS_READ");
                echo "</a></li>
      </ul>
<div class=\"space10\"></div>
";
            }
            // line 33
            echo "\t";
            $location = "forumlist_body.html";
            $namespace = false;
            if (strpos($location, '@') === 0) {
                $namespace = substr($location, 1, strpos($location, '/') - 1);
                $previous_look_up_order = $this->env->getNamespaceLookUpOrder();
                $this->env->setNamespaceLookUpOrder(array($namespace, '__main__'));
            }
            $this->loadTemplate("forumlist_body.html", "viewforum_body.html", 33)->display($context);
            if ($namespace) {
                $this->env->setNamespaceLookUpOrder($previous_look_up_order);
            }
        }
        // line 35
        echo "
";
        // line 36
        if (((((isset($context["S_DISPLAY_POST_INFO"]) ? $context["S_DISPLAY_POST_INFO"] : null) || twig_length_filter($this->env, $this->getAttribute((isset($context["loops"]) ? $context["loops"] : null), "pagination", array()))) || (isset($context["TOTAL_POSTS"]) ? $context["TOTAL_POSTS"] : null)) || (isset($context["TOTAL_TOPICS"]) ? $context["TOTAL_TOPICS"] : null))) {
            // line 37
            echo "<div class=\"row\"> 
   <div class=\"col-md-4 col-xs-7\">
\t";
            // line 39
            if ((isset($context["S_DISPLAY_SEARCHBOX"]) ? $context["S_DISPLAY_SEARCHBOX"] : null)) {
                // line 40
                echo "\t<div class=\"pull-left\">
\t\t<form method=\"get\" id=\"topic-search\" action=\"";
                // line 41
                echo (isset($context["S_SEARCHBOX_ACTION"]) ? $context["S_SEARCHBOX_ACTION"] : null);
                echo "\">
\t\t<fieldset>
\t\t <div class=\"input-group input-group-sm\">
\t\t   <input type=\"text\" class=\"form-control\" name=\"keywords\" id=\"search_keywords\" value=\"\" placeholder=\"";
                // line 44
                echo $this->env->getExtension('phpbb')->lang("SEARCH_FORUM");
                echo "\"/>
\t\t  <div class=\"input-group-btn\">
\t\t   <button class=\"btn btn-default\" type=\"submit\" value=\"";
                // line 46
                echo $this->env->getExtension('phpbb')->lang("SEARCH");
                echo "\"><span class=\"hidden-xs\">";
                echo $this->env->getExtension('phpbb')->lang("SEARCH");
                echo "</span><i class=\"visible-xs fa fa-search fa-btn-fx\"></i></button>
\t\t  </div>
\t\t </div>
\t\t ";
                // line 49
                echo (isset($context["S_SEARCH_LOCAL_HIDDEN_FIELDS"]) ? $context["S_SEARCH_LOCAL_HIDDEN_FIELDS"] : null);
                echo "
\t\t</fieldset>
\t\t</form>
\t</div>
\t";
            }
            // line 54
            echo "  </div>
  
  <div class=\"col-md-8\">
   <div class=\"pull-right\">\t 
     <ul class=\"pagination pagination-sm hidden-xs\">
\t    ";
            // line 59
            if (((isset($context["U_WATCH_FORUM_LINK"]) ? $context["U_WATCH_FORUM_LINK"] : null) &&  !(isset($context["S_IS_BOT"]) ? $context["S_IS_BOT"] : null))) {
                // line 60
                echo "\t\t  <li class=\"t-";
                if ((isset($context["S_WATCHING_FORUM"]) ? $context["S_WATCHING_FORUM"] : null)) {
                    echo "unsubscribe";
                } else {
                    echo "subscribe";
                }
                echo "\">
\t\t   <a class=\"t-icon\" href=\"";
                // line 61
                echo (isset($context["U_WATCH_FORUM_LINK"]) ? $context["U_WATCH_FORUM_LINK"] : null);
                echo "\" title=\"";
                echo (isset($context["S_WATCH_FORUM_TITLE"]) ? $context["S_WATCH_FORUM_TITLE"] : null);
                echo "\" data-ajax=\"toggle_link\" data-toggle-class=\"t-";
                if ( !(isset($context["S_WATCHING_FORUM"]) ? $context["S_WATCHING_FORUM"] : null)) {
                    echo "unsubscribe";
                } else {
                    echo "subscribe";
                }
                echo "\" data-toggle-url=\"";
                echo (isset($context["U_WATCH_FORUM_TOGGLE"]) ? $context["U_WATCH_FORUM_TOGGLE"] : null);
                echo "\"></a>
\t\t  </li>
\t\t";
            }
            // line 64
            echo "\t\t";
            if ((( !(isset($context["S_IS_BOT"]) ? $context["S_IS_BOT"] : null) && (isset($context["U_MARK_TOPICS"]) ? $context["U_MARK_TOPICS"] : null)) && twig_length_filter($this->env, $this->getAttribute((isset($context["loops"]) ? $context["loops"] : null), "topicrow", array())))) {
                echo "<li><a href=\"";
                echo (isset($context["U_MARK_TOPICS"]) ? $context["U_MARK_TOPICS"] : null);
                echo "\" class=\"mark\" data-ajax=\"mark_topics_read\">";
                echo $this->env->getExtension('phpbb')->lang("MARK_TOPICS_READ");
                echo "</a></li>";
            }
            // line 65
            echo "\t\t <li><a>";
            echo (isset($context["TOTAL_TOPICS"]) ? $context["TOTAL_TOPICS"] : null);
            echo "</a></li>
\t\t";
            // line 66
            if (twig_length_filter($this->env, $this->getAttribute((isset($context["loops"]) ? $context["loops"] : null), "pagination", array()))) {
                // line 67
                echo "\t\t\t";
                $location = "pagination.html";
                $namespace = false;
                if (strpos($location, '@') === 0) {
                    $namespace = substr($location, 1, strpos($location, '/') - 1);
                    $previous_look_up_order = $this->env->getNamespaceLookUpOrder();
                    $this->env->setNamespaceLookUpOrder(array($namespace, '__main__'));
                }
                $this->loadTemplate("pagination.html", "viewforum_body.html", 67)->display($context);
                if ($namespace) {
                    $this->env->setNamespaceLookUpOrder($previous_look_up_order);
                }
                // line 68
                echo "\t\t";
            } else {
                // line 69
                echo "\t\t\t<li class=\"active\"><a>";
                echo (isset($context["PAGE_NUMBER"]) ? $context["PAGE_NUMBER"] : null);
                echo "</a></li>\t
\t\t";
            }
            // line 71
            echo "     </ul>
\t
\t<div class=\"visible-xs\"> 
     <ul class=\"pagination pagination-sm\">
\t";
            // line 75
            if (((twig_length_filter($this->env, $this->getAttribute((isset($context["loops"]) ? $context["loops"] : null), "pagination", array())) || (isset($context["TOTAL_POSTS"]) ? $context["TOTAL_POSTS"] : null)) || (isset($context["TOTAL_TOPICS"]) ? $context["TOTAL_TOPICS"] : null))) {
                // line 76
                echo "\t ";
                if (((isset($context["TOTAL_POSTS"]) ? $context["TOTAL_POSTS"] : null) &&  !(isset($context["NEWEST_USER"]) ? $context["NEWEST_USER"] : null))) {
                    echo "<li class=\"active\"><a>";
                    echo (isset($context["TOTAL_POSTS"]) ? $context["TOTAL_POSTS"] : null);
                    echo "</a></li>";
                } elseif (((isset($context["TOTAL_TOPICS"]) ? $context["TOTAL_TOPICS"] : null) &&  !(isset($context["NEWEST_USER"]) ? $context["NEWEST_USER"] : null))) {
                    echo "<li class=\"active\"><a>";
                    echo (isset($context["TOTAL_TOPICS"]) ? $context["TOTAL_TOPICS"] : null);
                    echo "</a></li>";
                }
                // line 77
                echo "\t";
            }
            // line 78
            echo "\t</ul>
\t</div>
   </div>
   </div>
   
</div>
   
<div class=\"clearfix\">
   <div class=\"pull-left\">
     ";
            // line 87
            // line 88
            echo "   ";
            if ((isset($context["S_IS_LOCKED"]) ? $context["S_IS_LOCKED"] : null)) {
                // line 89
                echo "    <a href=\"";
                echo (isset($context["U_POST_NEW_TOPIC"]) ? $context["U_POST_NEW_TOPIC"] : null);
                echo "\" role=\"button\" class=\"btn btn-danger\"><i class=\"fa fa-lock\"></i>&nbsp;";
                echo $this->env->getExtension('phpbb')->lang("FORUM_LOCKED");
                echo "</a>
\t";
            } else {
                // line 91
                echo "\t<a href=\"";
                echo (isset($context["U_POST_NEW_TOPIC"]) ? $context["U_POST_NEW_TOPIC"] : null);
                echo "\" role=\"button\" class=\"btn btn-default btn-load\" data-loading-text=\"";
                echo $this->env->getExtension('phpbb')->lang("LOADING");
                echo "&nbsp;<i class='fa-spin fa fa-spinner fa-lg icon-white'></i>\"><i class=\"fa fa-plus\"></i>&nbsp;";
                echo $this->env->getExtension('phpbb')->lang("POST_TOPIC_NEW");
                echo "</a>
    ";
            }
            // line 93
            echo "\t ";
            // line 94
            echo "   </div>
</div>

   <div class=\"space10\"></div>
    <div class=\"space10\"></div>
";
        }
        // line 100
        echo "
";
        // line 101
        if ((isset($context["S_NO_READ_ACCESS"]) ? $context["S_NO_READ_ACCESS"] : null)) {
            // line 102
            echo "\t<div class=\"alert alert-danger fade in\">
\t\t<strong>";
            // line 103
            echo $this->env->getExtension('phpbb')->lang("NO_READ_ACCESS");
            echo "</strong>
\t</div>\t
";
            // line 105
            if (( !(isset($context["S_USER_LOGGED_IN"]) ? $context["S_USER_LOGGED_IN"] : null) &&  !(isset($context["S_IS_BOT"]) ? $context["S_IS_BOT"] : null))) {
                // line 106
                echo "  <section class=\"panel-login panel-w-form login-full\">
            <div class=\"row\">
                ";
                // line 108
                if ((isset($context["S_REGISTER_ENABLED"]) ? $context["S_REGISTER_ENABLED"] : null)) {
                    // line 109
                    echo "\t\t\t\t<div class=\"col-sm-6\">
\t\t\t\t<div class=\"signin-text\">
\t\t\t\t\t<span>";
                    // line 111
                    echo $this->env->getExtension('phpbb')->lang("CREATE_ACCOUNT");
                    echo "</span>
\t\t\t\t</div>
                    <p>";
                    // line 113
                    echo $this->env->getExtension('phpbb')->lang("LOGIN_INFO");
                    echo "</p>
\t\t\t\t    <p><a href=\"";
                    // line 114
                    echo (isset($context["U_TERMS_USE"]) ? $context["U_TERMS_USE"] : null);
                    echo "\">";
                    echo $this->env->getExtension('phpbb')->lang("TERMS_USE");
                    echo "</a>&nbsp;&#124;&nbsp;<a href=\"";
                    echo (isset($context["U_PRIVACY"]) ? $context["U_PRIVACY"] : null);
                    echo "\">";
                    echo $this->env->getExtension('phpbb')->lang("PRIVACY");
                    echo "</a></p>
\t\t\t\t\t<p><a href=\"";
                    // line 115
                    echo (isset($context["U_REGISTER"]) ? $context["U_REGISTER"] : null);
                    echo "\" class=\"btn btn-default\">";
                    echo $this->env->getExtension('phpbb')->lang("REGISTER");
                    echo "</a></p>
                </div>
\t\t\t\t";
                } else {
                    // line 118
                    echo "\t\t\t\t<div class=\"col-sm-6\">
\t\t\t\t<div class=\"signin-text\">
\t\t\t\t\t<span>";
                    // line 120
                    echo $this->env->getExtension('phpbb')->lang("CREATE_ACCOUNT_DISABLED");
                    echo "</span>
\t\t\t\t</div>
                    <p>";
                    // line 122
                    echo $this->env->getExtension('phpbb')->lang("REGISTRATION_DISABLED");
                    echo "</p>
\t\t\t\t    <p><a href=\"";
                    // line 123
                    echo (isset($context["U_TERMS_USE"]) ? $context["U_TERMS_USE"] : null);
                    echo "\">";
                    echo $this->env->getExtension('phpbb')->lang("TERMS_USE");
                    echo "</a>&nbsp;&#124;&nbsp;<a href=\"";
                    echo (isset($context["U_PRIVACY"]) ? $context["U_PRIVACY"] : null);
                    echo "\">";
                    echo $this->env->getExtension('phpbb')->lang("PRIVACY");
                    echo "</a></p>
\t\t\t\t\t<p><a href=\"mailto:";
                    // line 124
                    echo (isset($context["BOARD_EMAIL"]) ? $context["BOARD_EMAIL"] : null);
                    echo "?subject=Registrations Closed&body=Dear Admin, %0A%0AI Just wanted to let you know that the board registrations are closed. %0A%0AThis might be an error and I would like to register. %0A%0APlease let me know if this is possible.%0A%0AThanks!\" class=\"btn btn-default\">";
                    echo $this->env->getExtension('phpbb')->lang("CONTACT_WEBMASTER");
                    echo "</a></p>
                </div>
\t\t\t\t";
                }
                // line 127
                echo "\t\t\t\t<div class=\"col-sm-6\">
\t\t\t\t<div class=\"signin-text\">
\t\t\t\t\t<span>";
                // line 129
                echo $this->env->getExtension('phpbb')->lang("SIGN_IN_ACCOUNT");
                echo "</span>
\t\t\t\t</div>
\t\t\t\t <form role=\"form\" method=\"post\" action=\"";
                // line 131
                echo (isset($context["S_LOGIN_ACTION"]) ? $context["S_LOGIN_ACTION"] : null);
                echo "\">
\t\t\t\t  <fieldset>
\t\t\t\t\t<div class=\"form-group\">
\t\t\t\t\t <label class=\"sr-only\" for=\"username\">";
                // line 134
                echo $this->env->getExtension('phpbb')->lang("USERNAME");
                echo $this->env->getExtension('phpbb')->lang("COLON");
                echo "</label>
\t\t\t\t\t<div class=\"form-icon\">
\t\t\t\t\t <input type=\"text\" class=\"form-control input-lg\" name=\"username\" id=\"username\" placeholder=\"";
                // line 136
                echo $this->env->getExtension('phpbb')->lang("USERNAME");
                echo "\">
\t\t\t\t\t <span class=\"fa fa-user login-form-icon\"></span>
\t\t\t\t\t</div> 
\t\t\t\t    </div> 
\t\t\t\t\t<div class=\"form-group\">
\t\t\t\t\t  <label class=\"sr-only\" for=\"password\">";
                // line 141
                echo $this->env->getExtension('phpbb')->lang("PASSWORD");
                echo $this->env->getExtension('phpbb')->lang("COLON");
                echo "</label>
\t\t\t\t\t  <div class=\"form-icon\">
\t\t\t\t\t\t<input type=\"password\" class=\"form-control input-lg\" name=\"password\" id=\"password\" placeholder=\"";
                // line 143
                echo $this->env->getExtension('phpbb')->lang("PASSWORD");
                echo "\">
\t\t\t\t\t\t<span class=\"fa fa-lock login-form-icon\"></span>
\t\t\t\t\t  </div> 
\t\t\t\t\t</div>
\t\t\t\t <p>
\t\t\t\t    ";
                // line 148
                if ((isset($context["S_AUTOLOGIN_ENABLED"]) ? $context["S_AUTOLOGIN_ENABLED"] : null)) {
                    // line 149
                    echo "\t\t\t\t\t<div class=\"checkbox pull-right\">
\t\t\t\t\t  <label for=\"autologin\"><input type=\"checkbox\" name=\"autologin\" id=\"autologin\">";
                    // line 150
                    echo $this->env->getExtension('phpbb')->lang("LOGIN_REMEMBER");
                    echo "</label>
\t\t\t\t\t</div>
\t\t\t\t    ";
                }
                // line 153
                echo "\t\t\t\t\t<button type=\"submit\" class=\"btn btn-primary\" name=\"login\" value=\"";
                echo $this->env->getExtension('phpbb')->lang("LOGIN");
                echo "\" data-loading-text=\"";
                echo $this->env->getExtension('phpbb')->lang("LOADING_LOG_IN");
                echo " <i class='fa-spin fa fa-spinner fa-lg'></i>\">";
                echo $this->env->getExtension('phpbb')->lang("LOGIN_ME_IN");
                echo "</button>
\t\t\t\t\t";
                // line 154
                echo (isset($context["S_LOGIN_REDIRECT"]) ? $context["S_LOGIN_REDIRECT"] : null);
                echo "
\t\t\t\t  </p>
\t\t\t\t  </fieldset>
\t\t\t\t  </form>
\t\t\t    </div>  
            </div>
    </section>
";
            }
        }
        // line 163
        echo "

";
        // line 165
        $context['_parent'] = (array) $context;
        $context['_seq'] = twig_ensure_traversable($this->getAttribute((isset($context["loops"]) ? $context["loops"] : null), "topicrow", array()));
        $context['_iterated'] = false;
        foreach ($context['_seq'] as $context["_key"] => $context["topicrow"]) {
            // line 166
            echo "\t";
            if (( !$this->getAttribute($context["topicrow"], "S_TOPIC_TYPE_SWITCH", array()) &&  !$this->getAttribute($context["topicrow"], "S_FIRST_ROW", array()))) {
                // line 167
                echo "\t</table>
\t</div>
\t</div>
\t";
            }
            // line 171
            echo "
\t";
            // line 172
            if (($this->getAttribute($context["topicrow"], "S_FIRST_ROW", array()) ||  !$this->getAttribute($context["topicrow"], "S_TOPIC_TYPE_SWITCH", array()))) {
                // line 173
                echo "\t<div class=\"panel panel-forum\">
\t<div class=\"panel-heading\">
\t ";
                // line 175
                if ((isset($context["S_DISPLAY_ACTIVE"]) ? $context["S_DISPLAY_ACTIVE"] : null)) {
                    echo $this->env->getExtension('phpbb')->lang("ACTIVE_TOPICS");
                } elseif (($this->getAttribute($context["topicrow"], "S_TOPIC_TYPE_SWITCH", array()) && ($this->getAttribute($context["topicrow"], "S_POST_ANNOUNCE", array()) || $this->getAttribute($context["topicrow"], "S_POST_GLOBAL", array())))) {
                    echo $this->env->getExtension('phpbb')->lang("ANNOUNCEMENTS");
                } else {
                    echo $this->env->getExtension('phpbb')->lang("TOPICS");
                }
                // line 176
                echo "\t</div>
\t<div class=\"panel-inner\">
\t<table class=\"footable table table-striped table-primary table-hover\">
\t<thead>
\t\t<tr>
\t\t\t<th data-class=\"expand\">";
                // line 181
                echo $this->env->getExtension('phpbb')->lang("TITLE");
                echo "</th>
\t\t\t<th class=\"large110\" data-hide=\"phone\">";
                // line 182
                echo $this->env->getExtension('phpbb')->lang("TOPICS_POSTS_STATISTICS");
                echo "</th>
\t\t\t<th class=\"large21\" data-hide=\"phone\">";
                // line 183
                echo $this->env->getExtension('phpbb')->lang("LAST_POST");
                echo "</th>
\t\t</tr>
\t</thead>\t\t
\t<tbody>
\t";
            }
            // line 188
            echo "\t\t<tr>
\t\t\t<td>
\t\t        ";
            // line 190
            if (($this->getAttribute($context["topicrow"], "TOPIC_ICON_IMG", array()) && (isset($context["S_TOPIC_ICONS"]) ? $context["S_TOPIC_ICONS"] : null))) {
                // line 191
                echo "\t\t\t\t<i class=\"topic-icon\" style=\"background-image: url(";
                echo (isset($context["T_ICONS_PATH"]) ? $context["T_ICONS_PATH"] : null);
                echo $this->getAttribute($context["topicrow"], "TOPIC_ICON_IMG", array());
                echo "); background-repeat: no-repeat;\" title=\"";
                echo $this->getAttribute($context["topicrow"], "TOPIC_FOLDER_IMG_ALT", array());
                echo "\"></i>
\t\t\t\t";
            }
            // line 193
            echo "\t\t\t\t<span class=\"icon-wrapper\">
\t\t\t    <i class=\"row-icon-font icon-moon-default2";
            // line 194
            if ($this->getAttribute($context["topicrow"], "S_POST_ANNOUNCE", array())) {
                echo " icon-moon-voice2";
            }
            if ($this->getAttribute($context["topicrow"], "S_POST_GLOBAL", array())) {
                echo " icon-moon-podcast2";
            }
            if ($this->getAttribute($context["topicrow"], "S_POST_STICKY", array())) {
                echo " icon-moon-pushpin2";
            }
            if ($this->getAttribute($context["topicrow"], "S_HAS_POLL", array())) {
                echo " icon-moon-poll";
            }
            if ($this->getAttribute($context["topicrow"], "S_TOPIC_MOVED", array())) {
                echo " icon-moon-moved";
            }
            if ($this->getAttribute($context["topicrow"], "S_UNREAD_TOPIC", array())) {
                echo " forum-unread";
            } else {
                echo " forum-read";
            }
            echo "\" title=\"";
            echo $this->getAttribute($context["topicrow"], "TOPIC_FOLDER_IMG_ALT", array());
            echo "\"></i>
\t\t\t\t</span>
\t\t\t\t<i class=\"row-icon-font-mini";
            // line 196
            if ($this->getAttribute($context["topicrow"], "S_TOPIC_LOCKED", array())) {
                echo " icon-moon-lock forumview-lock";
            }
            echo "\" title=\"";
            echo $this->getAttribute($context["topicrow"], "TOPIC_FOLDER_IMG_ALT", array());
            echo "\"></i>
\t\t\t  <div class=\"desc-wrapper\">
\t\t\t  ";
            // line 198
            // line 199
            echo "\t\t\t\t";
            if ($this->getAttribute($context["topicrow"], "S_UNREAD_TOPIC", array())) {
                echo "<a href=\"";
                echo $this->getAttribute($context["topicrow"], "U_NEWEST_POST", array());
                echo "\" title=\"";
                echo $this->env->getExtension('phpbb')->lang("VIEW_FIRST_UNREAD");
                echo "\"><i class=\"topic-newest fa fa-asterisk\"></i></a>";
            }
            echo "<a href=\"";
            echo $this->getAttribute($context["topicrow"], "U_VIEW_TOPIC", array());
            echo "\" class=\"topictitle\">&nbsp;";
            echo $this->getAttribute($context["topicrow"], "TOPIC_TITLE", array());
            echo "</a>
\t\t\t\t";
            // line 200
            if (($this->getAttribute($context["topicrow"], "S_TOPIC_UNAPPROVED", array()) || $this->getAttribute($context["topicrow"], "S_POSTS_UNAPPROVED", array()))) {
                echo "<a href=\"";
                echo $this->getAttribute($context["topicrow"], "U_MCP_QUEUE", array());
                echo "\" title=\"";
                echo $this->env->getExtension('phpbb')->lang("TOPICS_ROW_NOT_APPROVED");
                echo "\">&nbsp;<i class=\"fa fa-question-circle\"></i></a>";
            }
            // line 201
            echo "\t\t\t\t";
            if ($this->getAttribute($context["topicrow"], "S_TOPIC_REPORTED", array())) {
                echo "<a href=\"";
                echo $this->getAttribute($context["topicrow"], "U_MCP_REPORT", array());
                echo "\" title=\"";
                echo $this->env->getExtension('phpbb')->lang("TOPICS_ROW_REPORTED");
                echo "\">&nbsp;<i class=\"fa fa-exclamation-circle text-danger\"></i></a>";
            }
            // line 202
            echo "\t\t\t\t";
            if ($this->getAttribute($context["topicrow"], "S_TOPIC_DELETED", array())) {
                echo "<a href=\"";
                echo $this->getAttribute($context["topicrow"], "U_MCP_QUEUE", array());
                echo "\" title=\"";
                echo $this->env->getExtension('phpbb')->lang("TOPICS_ROW_DELETED");
                echo "\">&nbsp;<i class=\"fa fa-exclamation-circle text-danger\"></i></a>";
            }
            echo "<br />
\t\t\t\t";
            // line 203
            if (twig_length_filter($this->env, $this->getAttribute($context["topicrow"], "pagination", array()))) {
                // line 204
                echo "\t\t\t\t    <ul class=\"pagination pagination-forum pagination-xs pull-right hidden-sm hidden-xs\">
\t\t\t\t\t\t";
                // line 205
                $context['_parent'] = (array) $context;
                $context['_seq'] = twig_ensure_traversable($this->getAttribute($context["topicrow"], "pagination", array()));
                foreach ($context['_seq'] as $context["_key"] => $context["pagination"]) {
                    // line 206
                    echo "\t\t\t\t\t\t ";
                    if ($this->getAttribute($context["pagination"], "S_IS_PREV", array())) {
                        // line 207
                        echo "\t\t\t\t\t\t ";
                    } elseif ($this->getAttribute($context["pagination"], "S_IS_CURRENT", array())) {
                        echo "<li class=\"active\">";
                        echo $this->getAttribute($context["pagination"], "PAGE_NUMBER", array());
                        echo "</li>
\t\t\t\t\t\t ";
                    } elseif ($this->getAttribute(                    // line 208
$context["pagination"], "S_IS_ELLIPSIS", array())) {
                        echo "<li class=\"ellipsis\"><a>";
                        echo $this->env->getExtension('phpbb')->lang("ELLIPSIS");
                        echo "</a></li>
\t\t\t\t\t\t ";
                    } elseif ($this->getAttribute(                    // line 209
$context["pagination"], "S_IS_NEXT", array())) {
                        // line 210
                        echo "\t\t\t\t\t\t";
                    } else {
                        // line 211
                        echo "\t\t\t\t\t\t <li><a href=\"";
                        echo $this->getAttribute($context["pagination"], "PAGE_URL", array());
                        echo "\">";
                        echo $this->getAttribute($context["pagination"], "PAGE_NUMBER", array());
                        echo "</a></li>
\t\t\t\t\t\t";
                    }
                    // line 213
                    echo "\t\t\t\t\t\t";
                }
                $_parent = $context['_parent'];
                unset($context['_seq'], $context['_iterated'], $context['_key'], $context['pagination'], $context['_parent'], $context['loop']);
                $context = array_intersect_key($context, $_parent) + $_parent;
                // line 214
                echo "\t\t\t\t\t</ul>\t\t
\t\t\t    ";
            }
            // line 216
            echo "\t\t\t\t";
            if ($this->getAttribute($context["topicrow"], "ATTACH_ICON_IMG", array())) {
                echo "<i class=\"fa fa-paperclip fa-flip-horizontal\" title=\"";
                echo $this->env->getExtension('phpbb')->lang("ATTACH_FORUM");
                echo "\"></i>";
            }
            // line 217
            echo "\t\t\t\t";
            echo $this->env->getExtension('phpbb')->lang("POST_BY_AUTHOR");
            echo "&nbsp;";
            echo $this->getAttribute($context["topicrow"], "TOPIC_AUTHOR_FULL", array());
            echo " 
\t\t\t\t<small>&nbsp;&#45;&nbsp;";
            // line 218
            echo $this->getAttribute($context["topicrow"], "FIRST_POST_TIME", array());
            echo "</small>
\t\t\t\t";
            // line 219
            if (($this->getAttribute($context["topicrow"], "S_POST_GLOBAL", array()) && ((isset($context["FORUM_ID"]) ? $context["FORUM_ID"] : null) != $this->getAttribute($context["topicrow"], "FORUM_ID", array())))) {
                echo "<small>&nbsp;&#45;&nbsp;";
                echo $this->env->getExtension('phpbb')->lang("IN");
                echo $this->env->getExtension('phpbb')->lang("COLON");
                echo "&nbsp;<a href=\"";
                echo $this->getAttribute($context["topicrow"], "U_VIEW_FORUM", array());
                echo "\">";
                echo $this->getAttribute($context["topicrow"], "FORUM_NAME", array());
                echo "</a></small>";
            }
            // line 220
            echo "\t\t\t  ";
            echo "\t
\t\t\t  </div>
\t\t\t</td>
\t\t\t<td class=\"stats-col\">
\t\t\t <span class=\"stats-wrapper\">
\t\t\t ";
            // line 225
            echo $this->getAttribute($context["topicrow"], "REPLIES", array());
            echo "&nbsp;";
            echo $this->env->getExtension('phpbb')->lang("REPLIES");
            echo "&nbsp;<br />&nbsp;";
            echo $this->getAttribute($context["topicrow"], "VIEWS", array());
            echo "&nbsp;";
            echo $this->env->getExtension('phpbb')->lang("VIEWS");
            echo "
\t\t\t </span>
\t\t\t</td>
\t\t\t<td> 
\t\t\t<span class=\"last-wrapper text-overflow\">
\t\t\t";
            // line 230
            // line 231
            echo "\t\t\t ";
            echo $this->env->getExtension('phpbb')->lang("POST_BY_AUTHOR");
            echo "&nbsp;";
            echo $this->getAttribute($context["topicrow"], "LAST_POST_AUTHOR_FULL", array());
            echo "
\t\t\t ";
            // line 232
            if ( !(isset($context["S_IS_BOT"]) ? $context["S_IS_BOT"] : null)) {
                echo "<a title=\"";
                echo $this->env->getExtension('phpbb')->lang("FORUMLIST_LASTPOST");
                echo "\" href=\"";
                echo $this->getAttribute($context["topicrow"], "U_LAST_POST", array());
                echo "\"><i class=\"mobile-post fa fa-sign-out\"></i></a>";
            }
            // line 233
            echo "\t\t\t <br /><small>";
            echo $this->getAttribute($context["topicrow"], "LAST_POST_TIME", array());
            echo "</small>
\t\t\t</span>
\t\t\t</td>
\t\t</tr>
\t";
            // line 237
            if ($this->getAttribute($context["topicrow"], "S_LAST_ROW", array())) {
                // line 238
                echo "\t </tbody>
\t</table>
\t</div>
    </div>
\t";
            }
            // line 243
            echo "
";
            $context['_iterated'] = true;
        }
        if (!$context['_iterated']) {
            // line 245
            echo "\t";
            if ((isset($context["S_IS_POSTABLE"]) ? $context["S_IS_POSTABLE"] : null)) {
                // line 246
                echo "\t<div class=\"well\">
\t\t<strong>";
                // line 247
                echo $this->env->getExtension('phpbb')->lang("NO_TOPICS");
                echo "</strong>
\t</div>
\t";
            }
        }
        $_parent = $context['_parent'];
        unset($context['_seq'], $context['_iterated'], $context['_key'], $context['topicrow'], $context['_parent'], $context['loop']);
        $context = array_intersect_key($context, $_parent) + $_parent;
        // line 251
        echo "
";
        // line 252
        if ((twig_length_filter($this->env, $this->getAttribute((isset($context["loops"]) ? $context["loops"] : null), "topicrow", array())) &&  !(isset($context["S_DISPLAY_ACTIVE"]) ? $context["S_DISPLAY_ACTIVE"] : null))) {
            // line 253
            echo "<div class=\"clearfix\">
 <div class=\"pull-left\">
";
            // line 255
            if (( !(isset($context["S_IS_BOT"]) ? $context["S_IS_BOT"] : null) && (isset($context["S_DISPLAY_POST_INFO"]) ? $context["S_DISPLAY_POST_INFO"] : null))) {
                // line 256
                echo " ";
                // line 257
                if ((isset($context["S_IS_LOCKED"]) ? $context["S_IS_LOCKED"] : null)) {
                    // line 258
                    echo "    <a href=\"";
                    echo (isset($context["U_POST_NEW_TOPIC"]) ? $context["U_POST_NEW_TOPIC"] : null);
                    echo "\" role=\"button\" class=\"btn btn-danger\"><i class=\"fa fa-lock\"></i>&nbsp;";
                    echo $this->env->getExtension('phpbb')->lang("FORUM_LOCKED");
                    echo "</a>
\t";
                } else {
                    // line 260
                    echo "\t<a href=\"";
                    echo (isset($context["U_POST_NEW_TOPIC"]) ? $context["U_POST_NEW_TOPIC"] : null);
                    echo "\" role=\"button\" class=\"btn btn-default btn-load\" data-loading-text=\"";
                    echo $this->env->getExtension('phpbb')->lang("LOADING");
                    echo "&nbsp;<i class='fa-spin fa fa-spinner fa-lg icon-white'></i>\"><i class=\"fa fa-plus\"></i>&nbsp;";
                    echo $this->env->getExtension('phpbb')->lang("POST_TOPIC_NEW");
                    echo "</a>
";
                }
                // line 262
                echo " ";
            }
            // line 264
            echo "</div>

 <div class=\"pull-right\">
     <ul class=\"pagination pagination-sm hidden-xs\">
\t  <li><a href=\"javascript:void(0);\" data-target=\".sorting\" data-toggle=\"collapse\">";
            // line 268
            echo $this->env->getExtension('phpbb')->lang("OPTIONS");
            echo "</a></li>\t\t\t
      <li><a>";
            // line 269
            echo (isset($context["TOTAL_TOPICS"]) ? $context["TOTAL_TOPICS"] : null);
            echo "</a></li>
\t\t";
            // line 270
            if (twig_length_filter($this->env, $this->getAttribute((isset($context["loops"]) ? $context["loops"] : null), "pagination", array()))) {
                // line 271
                echo "\t\t\t";
                $location = "pagination.html";
                $namespace = false;
                if (strpos($location, '@') === 0) {
                    $namespace = substr($location, 1, strpos($location, '/') - 1);
                    $previous_look_up_order = $this->env->getNamespaceLookUpOrder();
                    $this->env->setNamespaceLookUpOrder(array($namespace, '__main__'));
                }
                $this->loadTemplate("pagination.html", "viewforum_body.html", 271)->display($context);
                if ($namespace) {
                    $this->env->setNamespaceLookUpOrder($previous_look_up_order);
                }
                // line 272
                echo "\t\t";
            } else {
                // line 273
                echo "\t\t\t<li class=\"active\"><a>";
                echo (isset($context["PAGE_NUMBER"]) ? $context["PAGE_NUMBER"] : null);
                echo "</a></li>\t
\t\t";
            }
            // line 275
            echo "     </ul>
\t 
\t<div class=\"visible-xs\"> 
\t<ul class=\"pagination pagination-sm\">
\t   <li><a href=\"javascript:void(0);\" data-target=\".sorting\" data-toggle=\"collapse\"><i class=\"fa fa-cog\"></i></a></li>\t\t\t
       ";
            // line 280
            if (((isset($context["BASE_URL"]) ? $context["BASE_URL"] : null) && ((isset($context["TOTAL_PAGES"]) ? $context["TOTAL_PAGES"] : null) > 6))) {
                // line 281
                echo "       <li><a class=\"pagination-trigger\" data-placement=\"top\">";
                echo (isset($context["PAGE_NUMBER"]) ? $context["PAGE_NUMBER"] : null);
                echo "</a></li>
\t   ";
            }
            // line 283
            echo "\t   <li class=\"active\"><a>";
            echo (isset($context["TOTAL_TOPICS"]) ? $context["TOTAL_TOPICS"] : null);
            echo "</a></li>
\t</ul>
\t</div>
 </div>
</div>

<div class=\"clearfix\">
   <div class=\"pull-right\">
\t<div class=\"visible-xs\"> 
\t <ul class=\"pagination pagination-sm\">
\t   ";
            // line 293
            if (twig_length_filter($this->env, $this->getAttribute((isset($context["loops"]) ? $context["loops"] : null), "pagination", array()))) {
                // line 294
                echo "\t\t\t";
                $location = "pagination_mobile.html";
                $namespace = false;
                if (strpos($location, '@') === 0) {
                    $namespace = substr($location, 1, strpos($location, '/') - 1);
                    $previous_look_up_order = $this->env->getNamespaceLookUpOrder();
                    $this->env->setNamespaceLookUpOrder(array($namespace, '__main__'));
                }
                $this->loadTemplate("pagination_mobile.html", "viewforum_body.html", 294)->display($context);
                if ($namespace) {
                    $this->env->setNamespaceLookUpOrder($previous_look_up_order);
                }
                // line 295
                echo "\t\t";
            } else {
                // line 296
                echo "\t\t\t<li class=\"active\"><a>";
                echo (isset($context["PAGE_NUMBER"]) ? $context["PAGE_NUMBER"] : null);
                echo "</a></li>\t
\t\t";
            }
            // line 298
            echo "\t </ul>
\t</div>
   </div>
</div>\t
";
        }
        // line 303
        echo "\t
";
        // line 304
        $location = "jump_links.html";
        $namespace = false;
        if (strpos($location, '@') === 0) {
            $namespace = substr($location, 1, strpos($location, '/') - 1);
            $previous_look_up_order = $this->env->getNamespaceLookUpOrder();
            $this->env->setNamespaceLookUpOrder(array($namespace, '__main__'));
        }
        $this->loadTemplate("jump_links.html", "viewforum_body.html", 304)->display($context);
        if ($namespace) {
            $this->env->setNamespaceLookUpOrder($previous_look_up_order);
        }
        // line 305
        echo "<div class=\"space10\"></div>


";
        // line 308
        if (((isset($context["S_SELECT_SORT_DAYS"]) ? $context["S_SELECT_SORT_DAYS"] : null) &&  !(isset($context["S_DISPLAY_ACTIVE"]) ? $context["S_DISPLAY_ACTIVE"] : null))) {
            // line 309
            echo "\t<div class=\"controls-row\">
       <div class=\"sorting collapse\">
\t\t\t<div class=\"panel panel-default\">
\t\t\t\t<div class=\"panel-body\">
                  <div class=\"row\">
\t\t\t\t\t<form class=\"form-horizontal\" method=\"post\" action=\"";
            // line 314
            echo (isset($context["S_FORUM_ACTION"]) ? $context["S_FORUM_ACTION"] : null);
            echo "\">
\t\t\t\t\t\t<div class=\"col-md-3 col-sm-3\"> 
                         <label for=\"st\">";
            // line 316
            echo $this->env->getExtension('phpbb')->lang("DISPLAY");
            echo $this->env->getExtension('phpbb')->lang("COLON");
            echo "</label>
                            <div class=\"control-row\">
                              ";
            // line 318
            echo (isset($context["S_SELECT_SORT_DAYS"]) ? $context["S_SELECT_SORT_DAYS"] : null);
            echo "
                            </div>
\t\t\t\t\t\t</div>
\t                    <div class=\"col-md-3 col-sm-3\"> 
                          <label for=\"sk\">";
            // line 322
            echo $this->env->getExtension('phpbb')->lang("SORT_BY");
            echo "</label>
                            <div class=\"control-row\">
                              ";
            // line 324
            echo (isset($context["S_SELECT_SORT_KEY"]) ? $context["S_SELECT_SORT_KEY"] : null);
            echo "
                            </div>
\t\t\t\t\t\t</div>
\t\t\t\t\t\t<div class=\"col-md-3 col-sm-3\"> 
                           <label for=\"sd\">";
            // line 328
            echo $this->env->getExtension('phpbb')->lang("SORT_BY");
            echo "</label>
                            <div class=\"control-row\">
\t\t\t\t\t\t\t<div class=\"input-group\">
                             ";
            // line 331
            echo (isset($context["S_SELECT_SORT_DIR"]) ? $context["S_SELECT_SORT_DIR"] : null);
            echo "
\t\t\t\t\t\t\t <span class=\"input-group-btn\">
                              <button class=\"btn btn-default\" name=\"sort\" type=\"submit\">";
            // line 333
            echo $this->env->getExtension('phpbb')->lang("GO");
            echo "</button>
\t\t\t\t\t\t\t</span>
\t\t\t\t\t\t\t</div>
\t\t\t\t\t\t    </div>   
\t\t\t\t\t\t</div>
\t\t\t\t\t</form>
\t\t\t\t\t <div class=\"col-md-3 col-sm-3\"> 
                       <label accesskey=\"j\">";
            // line 340
            echo $this->env->getExtension('phpbb')->lang("JUMP_TO");
            echo $this->env->getExtension('phpbb')->lang("COLON");
            echo "</label>
                        <div class=\"control-row\">
                        ";
            // line 342
            $location = "jumpbox_options.html";
            $namespace = false;
            if (strpos($location, '@') === 0) {
                $namespace = substr($location, 1, strpos($location, '/') - 1);
                $previous_look_up_order = $this->env->getNamespaceLookUpOrder();
                $this->env->setNamespaceLookUpOrder(array($namespace, '__main__'));
            }
            $this->loadTemplate("jumpbox_options.html", "viewforum_body.html", 342)->display($context);
            if ($namespace) {
                $this->env->setNamespaceLookUpOrder($previous_look_up_order);
            }
            // line 343
            echo "                        </div>
\t\t\t\t\t </div>
                    </div>
                </div>
\t\t    </div>
\t\t</div>
\t</div> 
";
        }
        // line 351
        echo "
";
        // line 352
        if ((isset($context["S_USER_LOGGED_IN"]) ? $context["S_USER_LOGGED_IN"] : null)) {
            // line 353
            echo "<div class=\"row\">
";
            // line 354
            if ((isset($context["S_DISPLAY_ONLINE_LIST"]) ? $context["S_DISPLAY_ONLINE_LIST"] : null)) {
                // line 355
                echo "<div class=\"col-xs-12 col-sm-12 col-md-12 col-lg-6\">
<div class=\"panel panel-forum\">
<div class=\"panel-heading\">";
                // line 357
                if ((isset($context["U_VIEWONLINE"]) ? $context["U_VIEWONLINE"] : null)) {
                    echo "<a href=\"";
                    echo (isset($context["U_VIEWONLINE"]) ? $context["U_VIEWONLINE"] : null);
                    echo "\">";
                    echo $this->env->getExtension('phpbb')->lang("WHO_IS_ONLINE");
                    echo "</a>";
                } else {
                    echo $this->env->getExtension('phpbb')->lang("WHO_IS_ONLINE");
                }
                echo "</div>
 <div class=\"panel-body\">
\t<p>";
                // line 359
                echo (isset($context["LOGGED_IN_USER_LIST"]) ? $context["LOGGED_IN_USER_LIST"] : null);
                echo "</p>
 </div> 
</div> 
</div> 
";
            }
            // line 364
            echo "
<div class=\"col-xs-12 col-sm-12 col-md-12 col-lg-6\">
<div class=\"panel panel-forum\">
<div class=\"panel-heading\">";
            // line 367
            echo $this->env->getExtension('phpbb')->lang("FORUM_PERMISSIONS");
            echo "</div>
  <div class=\"panel-body\">
\t<p>";
            // line 369
            if ((isset($context["S_DISPLAY_POST_INFO"]) ? $context["S_DISPLAY_POST_INFO"] : null)) {
                $context['_parent'] = (array) $context;
                $context['_seq'] = twig_ensure_traversable($this->getAttribute((isset($context["loops"]) ? $context["loops"] : null), "rules", array()));
                foreach ($context['_seq'] as $context["_key"] => $context["rules"]) {
                    echo $this->getAttribute($context["rules"], "RULE", array());
                    echo "<br />";
                }
                $_parent = $context['_parent'];
                unset($context['_seq'], $context['_iterated'], $context['_key'], $context['rules'], $context['_parent'], $context['loop']);
                $context = array_intersect_key($context, $_parent) + $_parent;
            } else {
                echo $this->env->getExtension('phpbb')->lang("NOT_AVAILABLE");
            }
            echo "</p>
  </div> 
</div> 
 </div>
</div>
";
        }
        // line 375
        $location = "overall_footer.html";
        $namespace = false;
        if (strpos($location, '@') === 0) {
            $namespace = substr($location, 1, strpos($location, '/') - 1);
            $previous_look_up_order = $this->env->getNamespaceLookUpOrder();
            $this->env->setNamespaceLookUpOrder(array($namespace, '__main__'));
        }
        $this->loadTemplate("overall_footer.html", "viewforum_body.html", 375)->display($context);
        if ($namespace) {
            $this->env->setNamespaceLookUpOrder($previous_look_up_order);
        }
    }

    public function getTemplateName()
    {
        return "viewforum_body.html";
    }

    public function isTraitable()
    {
        return false;
    }

    public function getDebugInfo()
    {
        return array (  1097 => 375,  1076 => 369,  1071 => 367,  1066 => 364,  1058 => 359,  1045 => 357,  1041 => 355,  1039 => 354,  1036 => 353,  1034 => 352,  1031 => 351,  1021 => 343,  1009 => 342,  1003 => 340,  993 => 333,  988 => 331,  982 => 328,  975 => 324,  970 => 322,  963 => 318,  957 => 316,  952 => 314,  945 => 309,  943 => 308,  938 => 305,  926 => 304,  923 => 303,  916 => 298,  910 => 296,  907 => 295,  894 => 294,  892 => 293,  878 => 283,  872 => 281,  870 => 280,  863 => 275,  857 => 273,  854 => 272,  841 => 271,  839 => 270,  835 => 269,  831 => 268,  825 => 264,  822 => 262,  812 => 260,  804 => 258,  802 => 257,  800 => 256,  798 => 255,  794 => 253,  792 => 252,  789 => 251,  779 => 247,  776 => 246,  773 => 245,  767 => 243,  760 => 238,  758 => 237,  750 => 233,  742 => 232,  735 => 231,  734 => 230,  720 => 225,  712 => 220,  701 => 219,  697 => 218,  690 => 217,  683 => 216,  679 => 214,  673 => 213,  665 => 211,  662 => 210,  660 => 209,  654 => 208,  647 => 207,  644 => 206,  640 => 205,  637 => 204,  635 => 203,  624 => 202,  615 => 201,  607 => 200,  592 => 199,  591 => 198,  582 => 196,  556 => 194,  553 => 193,  544 => 191,  542 => 190,  538 => 188,  530 => 183,  526 => 182,  522 => 181,  515 => 176,  507 => 175,  503 => 173,  501 => 172,  498 => 171,  492 => 167,  489 => 166,  484 => 165,  480 => 163,  468 => 154,  459 => 153,  453 => 150,  450 => 149,  448 => 148,  440 => 143,  434 => 141,  426 => 136,  420 => 134,  414 => 131,  409 => 129,  405 => 127,  397 => 124,  387 => 123,  383 => 122,  378 => 120,  374 => 118,  366 => 115,  356 => 114,  352 => 113,  347 => 111,  343 => 109,  341 => 108,  337 => 106,  335 => 105,  330 => 103,  327 => 102,  325 => 101,  322 => 100,  314 => 94,  312 => 93,  302 => 91,  294 => 89,  291 => 88,  290 => 87,  279 => 78,  276 => 77,  265 => 76,  263 => 75,  257 => 71,  251 => 69,  248 => 68,  235 => 67,  233 => 66,  228 => 65,  219 => 64,  203 => 61,  194 => 60,  192 => 59,  185 => 54,  177 => 49,  169 => 46,  164 => 44,  158 => 41,  155 => 40,  153 => 39,  149 => 37,  147 => 36,  144 => 35,  130 => 33,  121 => 29,  118 => 28,  116 => 27,  114 => 26,  111 => 25,  107 => 23,  99 => 21,  96 => 20,  88 => 19,  86 => 18,  82 => 16,  80 => 15,  77 => 14,  73 => 12,  60 => 11,  54 => 10,  50 => 8,  48 => 7,  45 => 6,  44 => 5,  35 => 4,  34 => 3,  31 => 2,  19 => 1,);
    }
}
