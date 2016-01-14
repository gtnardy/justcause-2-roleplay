<?php

/* viewtopic_body.html */
class __TwigTemplate_4cfa1830d9c73e81926328b16eb59f3c87d16a76606cb7aaa3ffd4ac621abefc extends Twig_Template
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
        $this->loadTemplate("overall_header.html", "viewtopic_body.html", 1)->display($context);
        if ($namespace) {
            $this->env->setNamespaceLookUpOrder($previous_look_up_order);
        }
        // line 2
        echo "
<div class=\"side-segment\"><h3>";
        // line 3
        echo "<a href=\"";
        echo (isset($context["U_VIEW_TOPIC"]) ? $context["U_VIEW_TOPIC"] : null);
        echo "\">";
        echo (isset($context["TOPIC_TITLE"]) ? $context["TOPIC_TITLE"] : null);
        echo "</a>";
        echo "</h3></div>
<!-- NOTE: remove the style=\"display: none\" when you want to have the forum description on the topic body -->
";
        // line 5
        if ((isset($context["FORUM_DESC"]) ? $context["FORUM_DESC"] : null)) {
            echo "<div style=\"display: none;\">";
            echo (isset($context["FORUM_DESC"]) ? $context["FORUM_DESC"] : null);
            echo "<br /></div>";
        }
        // line 6
        echo "
";
        // line 7
        if ((isset($context["MODERATORS"]) ? $context["MODERATORS"] : null)) {
            // line 8
            echo "<p>
\t<strong>";
            // line 9
            if ((isset($context["S_SINGLE_MODERATOR"]) ? $context["S_SINGLE_MODERATOR"] : null)) {
                echo $this->env->getExtension('phpbb')->lang("MODERATOR");
            } else {
                echo $this->env->getExtension('phpbb')->lang("MODERATORS");
            }
            echo $this->env->getExtension('phpbb')->lang("COLON");
            echo "</strong>&nbsp;";
            echo (isset($context["MODERATORS"]) ? $context["MODERATORS"] : null);
            echo "
</p>
";
        }
        // line 12
        echo "
";
        // line 13
        if ((isset($context["S_FORUM_RULES"]) ? $context["S_FORUM_RULES"] : null)) {
            // line 14
            echo "<div class=\"alert alert-info fade in\">
\t<button class=\"close\" data-dismiss=\"alert\"><span class=\"awe-remove-circle\"></span></button>
\t";
            // line 16
            if ((isset($context["U_FORUM_RULES"]) ? $context["U_FORUM_RULES"] : null)) {
                // line 17
                echo "\t\t\t<a href=\"";
                echo (isset($context["U_FORUM_RULES"]) ? $context["U_FORUM_RULES"] : null);
                echo "\"><i class=\"fa fa-link fa-rotate-90\"></i>&nbsp;";
                echo $this->env->getExtension('phpbb')->lang("FORUM_RULES");
                echo "</a>
\t\t";
            } else {
                // line 18
                echo " 
\t\t<strong>";
                // line 19
                echo $this->env->getExtension('phpbb')->lang("FORUM_RULES");
                echo $this->env->getExtension('phpbb')->lang("COLON");
                echo "</strong>&nbsp;";
                echo (isset($context["FORUM_RULES"]) ? $context["FORUM_RULES"] : null);
                echo "
\t\t";
            }
            // line 21
            echo "</div>
";
        }
        // line 23
        echo "
<div class=\"row\">
<div class=\"col-md-4 col-xs-6\">
";
        // line 26
        if ((isset($context["S_DISPLAY_SEARCHBOX"]) ? $context["S_DISPLAY_SEARCHBOX"] : null)) {
            // line 27
            echo "  <div class=\"pull-left\">
\t<form method=\"get\" id=\"topic-search\" action=\"";
            // line 28
            echo (isset($context["S_SEARCHBOX_ACTION"]) ? $context["S_SEARCHBOX_ACTION"] : null);
            echo "\">
\t <fieldset>
\t<div class=\"input-group input-group-sm\">
      <input type=\"text\" class=\"form-control\" name=\"keywords\" id=\"search_keywords\" value=\"\" placeholder=\"";
            // line 31
            echo $this->env->getExtension('phpbb')->lang("SEARCH_TOPIC");
            echo "\">
      <div class=\"input-group-btn\">
        <button class=\"btn btn-default\" type=\"submit\" value=\"";
            // line 33
            echo $this->env->getExtension('phpbb')->lang("SEARCH");
            echo "\"><span class=\"hidden-xs\">";
            echo $this->env->getExtension('phpbb')->lang("SEARCH");
            echo "</span><i class=\"visible-xs fa fa-search fa-btn-fx\"></i></button>
\t  </div>
    </div>
\t ";
            // line 36
            echo (isset($context["S_SEARCH_LOCAL_HIDDEN_FIELDS"]) ? $context["S_SEARCH_LOCAL_HIDDEN_FIELDS"] : null);
            echo "
\t</fieldset>
    </form>
   </div>
";
        }
        // line 41
        echo "</div>

<div class=\"col-md-8\">
  <div class=\"pull-right\">\t 
     <ul class=\"pagination pagination-sm hidden-xs\">
\t\t <li class=\"active\"><a>";
        // line 46
        echo (isset($context["TOTAL_POSTS"]) ? $context["TOTAL_POSTS"] : null);
        echo "</a></li>
\t\t ";
        // line 47
        if (((isset($context["U_VIEW_UNREAD_POST"]) ? $context["U_VIEW_UNREAD_POST"] : null) &&  !(isset($context["S_IS_BOT"]) ? $context["S_IS_BOT"] : null))) {
            echo "<li><a href=\"";
            echo (isset($context["U_VIEW_UNREAD_POST"]) ? $context["U_VIEW_UNREAD_POST"] : null);
            echo "\">";
            echo $this->env->getExtension('phpbb')->lang("VIEW_UNREAD_POST");
            echo "</a></li>";
        }
        // line 48
        echo "\t\t";
        if ((twig_length_filter($this->env, $this->getAttribute((isset($context["loops"]) ? $context["loops"] : null), "pagination", array())) || (isset($context["TOTAL_POSTS"]) ? $context["TOTAL_POSTS"] : null))) {
            // line 49
            echo "\t\t\t";
            $location = "pagination.html";
            $namespace = false;
            if (strpos($location, '@') === 0) {
                $namespace = substr($location, 1, strpos($location, '/') - 1);
                $previous_look_up_order = $this->env->getNamespaceLookUpOrder();
                $this->env->setNamespaceLookUpOrder(array($namespace, '__main__'));
            }
            $this->loadTemplate("pagination.html", "viewtopic_body.html", 49)->display($context);
            if ($namespace) {
                $this->env->setNamespaceLookUpOrder($previous_look_up_order);
            }
            // line 50
            echo "\t\t";
        } else {
            // line 51
            echo "\t\t\t<li class=\"active\"><a>";
            echo (isset($context["PAGE_NUMBER"]) ? $context["PAGE_NUMBER"] : null);
            echo "</a></li>\t
\t\t";
        }
        // line 53
        echo "     </ul>
\t
\t<div class=\"visible-xs\"> 
     <ul class=\"pagination pagination-sm\">
\t";
        // line 57
        if (((twig_length_filter($this->env, $this->getAttribute((isset($context["loops"]) ? $context["loops"] : null), "pagination", array())) || (isset($context["TOTAL_POSTS"]) ? $context["TOTAL_POSTS"] : null)) || (isset($context["TOTAL_TOPICS"]) ? $context["TOTAL_TOPICS"] : null))) {
            // line 58
            echo "\t";
            if (((isset($context["TOTAL_POSTS"]) ? $context["TOTAL_POSTS"] : null) &&  !(isset($context["NEWEST_USER"]) ? $context["NEWEST_USER"] : null))) {
                echo "<li class=\"active\"><a>";
                echo (isset($context["TOTAL_POSTS"]) ? $context["TOTAL_POSTS"] : null);
                echo "</a></li>";
            } elseif (((isset($context["TOTAL_TOPICS"]) ? $context["TOTAL_TOPICS"] : null) &&  !(isset($context["NEWEST_USER"]) ? $context["NEWEST_USER"] : null))) {
                echo "<li class=\"active\"><a>";
                echo (isset($context["TOTAL_TOPICS"]) ? $context["TOTAL_TOPICS"] : null);
                echo "</a></li>";
            }
            // line 59
            echo "\t";
        }
        // line 60
        echo "\t</ul>
\t</div>
  </div>
</div> 

</div>

";
        // line 67
        // line 68
        echo "<div class=\"clearfix\">
    <div class=\"pull-left\">
   \t";
        // line 70
        if (( !(isset($context["S_IS_BOT"]) ? $context["S_IS_BOT"] : null) && (isset($context["S_DISPLAY_REPLY_INFO"]) ? $context["S_DISPLAY_REPLY_INFO"] : null))) {
            // line 71
            echo "\t ";
            // line 72
            echo "\t";
            if ((isset($context["S_IS_LOCKED"]) ? $context["S_IS_LOCKED"] : null)) {
                // line 73
                echo "     <a class=\"btn btn-danger\" href=\"";
                echo (isset($context["U_POST_REPLY_TOPIC"]) ? $context["U_POST_REPLY_TOPIC"] : null);
                echo "\" role=\"button\"><i class=\"fa fa-lock\"></i>&nbsp;";
                echo $this->env->getExtension('phpbb')->lang("TOPIC_LOCKED_SHORT");
                echo "</a>
\t";
            } else {
                // line 75
                echo "\t <a class=\"btn btn-default btn-load\" href=\"";
                echo (isset($context["U_POST_REPLY_TOPIC"]) ? $context["U_POST_REPLY_TOPIC"] : null);
                echo "\" role=\"button\" data-loading-text=\"";
                echo $this->env->getExtension('phpbb')->lang("LOADING");
                echo "&nbsp;<i class='fa-spin fa fa-spinner fa-lg icon-white'></i>\"><i class=\"fa fa-plus\"></i>&nbsp;";
                echo $this->env->getExtension('phpbb')->lang("REPLY");
                echo "</a>
    ";
            }
            // line 77
            echo "\t ";
            // line 78
            echo "\t";
        }
        // line 79
        echo "   </div>
   <div class=\"pull-right\">
    ";
        // line 81
        $location = "viewtopic_topic_tools.html";
        $namespace = false;
        if (strpos($location, '@') === 0) {
            $namespace = substr($location, 1, strpos($location, '/') - 1);
            $previous_look_up_order = $this->env->getNamespaceLookUpOrder();
            $this->env->setNamespaceLookUpOrder(array($namespace, '__main__'));
        }
        $this->loadTemplate("viewtopic_topic_tools.html", "viewtopic_body.html", 81)->display($context);
        if ($namespace) {
            $this->env->setNamespaceLookUpOrder($previous_look_up_order);
        }
        // line 82
        echo "   </div>
</div>
";
        // line 84
        // line 85
        echo "
<div class=\"space10\"></div>
 <div class=\"space10\"></div>

";
        // line 89
        // line 90
        echo " 
";
        // line 91
        if ((isset($context["S_HAS_POLL"]) ? $context["S_HAS_POLL"] : null)) {
            // line 92
            echo "<form method=\"post\" action=\"";
            echo (isset($context["S_POLL_ACTION"]) ? $context["S_POLL_ACTION"] : null);
            echo "\" data-ajax=\"vote_poll\" class=\"topic_poll\">
<fieldset>
<div class=\"panel panel-default panel-poll\">
 <div class=\"panel-heading\">
    <h3>";
            // line 96
            echo (isset($context["POLL_QUESTION"]) ? $context["POLL_QUESTION"] : null);
            echo "</h3>
\t";
            // line 97
            if (((isset($context["S_CAN_VOTE"]) ? $context["S_CAN_VOTE"] : null) && (isset($context["L_POLL_LENGTH"]) ? $context["L_POLL_LENGTH"] : null))) {
                // line 98
                echo "\t<div class=\"alert alert-info fade in\">
     <i class=\"fa fa-bar-chart-o\"></i>&nbsp;";
                // line 99
                echo $this->env->getExtension('phpbb')->lang("POLL_LENGTH");
                echo "
    </div>
\t";
            }
            // line 102
            echo " </div>
<div class=\"panel-body\">
<div class=\"inner\">
";
            // line 105
            $context['_parent'] = (array) $context;
            $context['_seq'] = twig_ensure_traversable($this->getAttribute((isset($context["loops"]) ? $context["loops"] : null), "poll_option", array()));
            foreach ($context['_seq'] as $context["_key"] => $context["poll_option"]) {
                // line 106
                // line 107
                echo "<div class=\"clearfix";
                if ($this->getAttribute($context["poll_option"], "POLL_OPTION_VOTED", array())) {
                    echo " voted";
                }
                if ($this->getAttribute($context["poll_option"], "POLL_OPTION_MOST_VOTES", array())) {
                    echo " most-votes";
                }
                echo "\"";
                if ($this->getAttribute($context["poll_option"], "POLL_OPTION_VOTED", array())) {
                    echo " title=\"";
                    echo $this->env->getExtension('phpbb')->lang("POLL_VOTED_OPTION");
                    echo "\"";
                }
                echo " data-poll-option-id=\"";
                echo $this->getAttribute($context["poll_option"], "POLL_OPTION_ID", array());
                echo "\">
<div class=\"pull-left\">
";
                // line 109
                if ((isset($context["S_CAN_VOTE"]) ? $context["S_CAN_VOTE"] : null)) {
                    // line 110
                    echo " <label for=\"vote_";
                    echo $this->getAttribute($context["poll_option"], "POLL_OPTION_ID", array());
                    echo "\">";
                    echo $this->getAttribute($context["poll_option"], "POLL_OPTION_CAPTION", array());
                    echo "</label>
";
                } else {
                    // line 112
                    echo " ";
                    echo $this->getAttribute($context["poll_option"], "POLL_OPTION_CAPTION", array());
                    echo "
";
                }
                // line 114
                echo "
<div class=\"poll_option_select pull-left\">
";
                // line 116
                if ((isset($context["S_CAN_VOTE"]) ? $context["S_CAN_VOTE"] : null)) {
                    // line 117
                    if ((isset($context["S_IS_MULTI_CHOICE"]) ? $context["S_IS_MULTI_CHOICE"] : null)) {
                        // line 118
                        echo "<input type=\"checkbox\" name=\"vote_id[]\" id=\"vote_";
                        echo $this->getAttribute($context["poll_option"], "POLL_OPTION_ID", array());
                        echo "\" value=\"";
                        echo $this->getAttribute($context["poll_option"], "POLL_OPTION_ID", array());
                        echo "\"";
                        if ($this->getAttribute($context["poll_option"], "POLL_OPTION_VOTED", array())) {
                            echo " checked=\"checked\"";
                        }
                        echo " />
";
                    } else {
                        // line 120
                        echo "<input type=\"radio\" name=\"vote_id[]\" id=\"vote_";
                        echo $this->getAttribute($context["poll_option"], "POLL_OPTION_ID", array());
                        echo "\" value=\"";
                        echo $this->getAttribute($context["poll_option"], "POLL_OPTION_ID", array());
                        echo "\"";
                        if ($this->getAttribute($context["poll_option"], "POLL_OPTION_VOTED", array())) {
                            echo " checked=\"checked\"";
                        }
                        echo " />";
                    }
                }
                // line 122
                echo "</div>
</div>
   <div class=\"poll_option_percent";
                // line 124
                if ( !(isset($context["S_DISPLAY_RESULTS"]) ? $context["S_DISPLAY_RESULTS"] : null)) {
                    echo " hidden";
                }
                echo " pull-right\">
    <span class=\"badge";
                // line 125
                if ($this->getAttribute($context["poll_option"], "POLL_OPTION_VOTED", array())) {
                    echo " badge-info";
                }
                echo "\"";
                if ($this->getAttribute($context["poll_option"], "POLL_OPTION_VOTED", array())) {
                    echo " title=\"";
                    echo $this->env->getExtension('phpbb')->lang("POLL_VOTED_OPTION");
                    echo "\"";
                }
                echo ">";
                if (($this->getAttribute($context["poll_option"], "POLL_OPTION_RESULT", array()) == 0)) {
                    echo $this->env->getExtension('phpbb')->lang("NO_VOTES");
                } else {
                    echo $this->getAttribute($context["poll_option"], "POLL_OPTION_RESULT", array());
                }
                echo "</span>
   </div>
<div class=\"space-poll\"></div>   
<div class=\"resultbar";
                // line 128
                if ( !(isset($context["S_DISPLAY_RESULTS"]) ? $context["S_DISPLAY_RESULTS"] : null)) {
                    echo " hidden";
                }
                echo " progress progress-fix clearfix\">
 <div role=\"progressbar\" aria-valuemin=\"0\" aria-valuemax=\"100\" class=\"progress-bar progress-bar-striped";
                // line 129
                if (($this->getAttribute($context["poll_option"], "POLL_OPTION_PCT", array()) < 20)) {
                    echo " pollbar1 progress-bar-danger";
                } elseif (($this->getAttribute($context["poll_option"], "POLL_OPTION_PCT", array()) < 40)) {
                    echo " pollbar2 progress-bar-warning";
                } elseif (($this->getAttribute($context["poll_option"], "POLL_OPTION_PCT", array()) < 60)) {
                    echo " pollbar3 progress-bar-info";
                } elseif (($this->getAttribute($context["poll_option"], "POLL_OPTION_PCT", array()) < 80)) {
                    echo " pollbar4 progress-bar-primary";
                } else {
                    echo " pollbar5 progress-bar-success active";
                }
                echo "\" style=\"width:";
                echo $this->getAttribute($context["poll_option"], "POLL_OPTION_PERCENT", array());
                echo ";min-width:2em;\">";
                echo $this->getAttribute($context["poll_option"], "POLL_OPTION_PERCENT", array());
                echo "</div>
</div>
</div>
";
                // line 132
            }
            $_parent = $context['_parent'];
            unset($context['_seq'], $context['_iterated'], $context['_key'], $context['poll_option'], $context['_parent'], $context['loop']);
            $context = array_intersect_key($context, $_parent) + $_parent;
            // line 134
            echo "</div>
</div>
<div class=\"panel-footer\">
  <div class=\"clearfix\">
    <ul class=\"list-unstyled pull-left\">
\t";
            // line 139
            if ( !(isset($context["S_DISPLAY_RESULTS"]) ? $context["S_DISPLAY_RESULTS"] : null)) {
                // line 140
                echo "    <li class=\"poll_view_results\"><a href=\"";
                echo (isset($context["U_VIEW_RESULTS"]) ? $context["U_VIEW_RESULTS"] : null);
                echo "\">";
                echo $this->env->getExtension('phpbb')->lang("VIEW_RESULTS");
                echo "</a></li>
\t";
            }
            // line 142
            echo "\t<li class=\"poll_total_votes";
            if ( !(isset($context["S_DISPLAY_RESULTS"]) ? $context["S_DISPLAY_RESULTS"] : null)) {
                echo " hidden";
            }
            echo "\">
\t <span class=\"resultbar\">";
            // line 143
            echo $this->env->getExtension('phpbb')->lang("TOTAL_VOTES");
            echo "&nbsp;";
            echo $this->env->getExtension('phpbb')->lang("COLON");
            echo "&nbsp;<span class=\"poll_total_vote_cnt\">";
            echo (isset($context["TOTAL_VOTES"]) ? $context["TOTAL_VOTES"] : null);
            echo "</span></span>
\t</li>
\t";
            // line 145
            if ((isset($context["S_CAN_VOTE"]) ? $context["S_CAN_VOTE"] : null)) {
                // line 146
                echo "\t<li class=\"poll_max_votes\">";
                echo $this->env->getExtension('phpbb')->lang("MAX_VOTES");
                echo "</li>
\t";
            }
            // line 148
            echo "\t</ul>
\t <div class=\"vote-submitted hidden\">&nbsp;<span class=\"label label-success\">";
            // line 149
            echo $this->env->getExtension('phpbb')->lang("VOTE_SUBMITTED");
            echo "</span></div>
\t";
            // line 150
            if ((isset($context["S_CAN_VOTE"]) ? $context["S_CAN_VOTE"] : null)) {
                // line 151
                echo "\t<div class=\"poll_vote pull-right\">
\t <div class=\"resultbar\"><input type=\"submit\" name=\"update\" value=\"";
                // line 152
                echo $this->env->getExtension('phpbb')->lang("SUBMIT_VOTE");
                echo "\" class=\"btn btn-default btn-poll\" data-loading-text=\"";
                echo $this->env->getExtension('phpbb')->lang("CASTING_VOTE");
                echo "\" autocomplete=\"off\" /></div>
\t</div>
\t";
            }
            // line 155
            echo "  </div>
</div>
    ";
            // line 157
            echo (isset($context["S_FORM_TOKEN"]) ? $context["S_FORM_TOKEN"] : null);
            echo "
\t ";
            // line 158
            echo (isset($context["S_HIDDEN_FIELDS"]) ? $context["S_HIDDEN_FIELDS"] : null);
            echo "
</div>
</fieldset>
</form>
";
        }
        // line 163
        // line 164
        echo "
";
        // line 165
        $context['_parent'] = (array) $context;
        $context['_seq'] = twig_ensure_traversable($this->getAttribute((isset($context["loops"]) ? $context["loops"] : null), "postrow", array()));
        $context['loop'] = array(
          'parent' => $context['_parent'],
          'index0' => 0,
          'index'  => 1,
          'first'  => true,
        );
        if (is_array($context['_seq']) || (is_object($context['_seq']) && $context['_seq'] instanceof Countable)) {
            $length = count($context['_seq']);
            $context['loop']['revindex0'] = $length - 1;
            $context['loop']['revindex'] = $length;
            $context['loop']['length'] = $length;
            $context['loop']['last'] = 1 === $length;
        }
        foreach ($context['_seq'] as $context["_key"] => $context["postrow"]) {
            // line 166
            // line 167
            // line 168
            echo "  ";
            if ($this->getAttribute($context["postrow"], "S_FIRST_UNREAD", array())) {
                // line 169
                echo "   <a id=\"unread\" class=\"anchor\"";
                if ((isset($context["S_UNREAD_VIEW"]) ? $context["S_UNREAD_VIEW"] : null)) {
                    echo " data-url=\"";
                    echo $this->getAttribute($context["postrow"], "U_MINI_POST", array());
                    echo "\"";
                }
                echo "></a>
  ";
            }
            // line 171
            echo "<div id=\"p";
            echo $this->getAttribute($context["postrow"], "POST_ID", array());
            echo "\" class=\"clearfix\">\t
    ";
            // line 172
            if ($this->getAttribute($context["postrow"], "S_POST_DELETED", array())) {
                // line 173
                echo "\t <div class=\"ignore alert alert-default\" id=\"post_hidden";
                echo $this->getAttribute($context["postrow"], "POST_ID", array());
                echo "\"";
                if ( !$this->getAttribute($context["postrow"], "S_POST_HIDDEN", array())) {
                    echo " style=\"display: none;\"";
                }
                echo ">
\t  ";
                // line 174
                echo $this->getAttribute($context["postrow"], "L_POST_DELETED_MESSAGE", array());
                echo "<br />
\t  <strong>";
                // line 175
                echo $this->getAttribute($context["postrow"], "L_POST_DISPLAY", array());
                echo "</strong>
\t </div>
\t";
            } elseif ($this->getAttribute(            // line 177
$context["postrow"], "S_IGNORE_POST", array())) {
                // line 178
                echo "\t <div class=\"ignore alert alert-warning\" id=\"post_hidden";
                echo $this->getAttribute($context["postrow"], "POST_ID", array());
                echo "\"";
                if ( !$this->getAttribute($context["postrow"], "S_POST_HIDDEN", array())) {
                    echo " style=\"display: none;\"";
                }
                echo ">
\t\t";
                // line 179
                echo $this->getAttribute($context["postrow"], "L_IGNORE_POST", array());
                echo "<br />
\t\t<strong>";
                // line 180
                echo $this->getAttribute($context["postrow"], "L_POST_DISPLAY", array());
                echo "</strong>
\t </div>
\t";
            }
            // line 183
            echo " <article ";
            if ($this->getAttribute($context["postrow"], "S_POST_HIDDEN", array())) {
                echo "style=\"display: none;\"";
            }
            echo ">
  <div class=\"panel";
            // line 184
            if ((((isset($context["MINI_PROFILE_POSITION"]) ? $context["MINI_PROFILE_POSITION"] : null) == "alternate") && ($this->getAttribute($context["postrow"], "S_ROW_COUNT", array()) % 2 == 1))) {
                echo " alt-odd";
            }
            echo " forum-answer";
            if ($this->getAttribute($context["postrow"], "S_ONLINE", array())) {
                echo " mobile-online";
            }
            echo "\">
    <div class=\"panel-heading\">
\t <div class=\"clearfix\">
         <div id=\"profile";
            // line 187
            echo $this->getAttribute($context["postrow"], "POST_ID", array());
            echo "\">
\t\t\t<div class=\"avatar-over";
            // line 188
            if ((((isset($context["MINI_PROFILE_POSITION"]) ? $context["MINI_PROFILE_POSITION"] : null) == "right") || (((isset($context["MINI_PROFILE_POSITION"]) ? $context["MINI_PROFILE_POSITION"] : null) == "alternate") && ($this->getAttribute($context["postrow"], "S_ROW_COUNT", array()) % 2 == 0)))) {
                echo " pull-right";
            } else {
                echo " pull-left";
            }
            echo "\">
\t\t\t\t";
            // line 189
            if ($this->getAttribute($context["postrow"], "POSTER_AVATAR", array())) {
                // line 190
                echo "\t\t\t\t\t";
                if ($this->getAttribute($context["postrow"], "U_POST_AUTHOR", array())) {
                    echo "<a href=\"javascript:void(0)\" data-toggle=\"modal\" data-target=\"#mini";
                    echo $this->getAttribute($context["postrow"], "POST_ID", array());
                    echo "\" title=\"";
                    echo $this->env->getExtension('phpbb')->lang("USER_MINI_PROFILE");
                    echo "\">";
                    echo $this->getAttribute($context["postrow"], "POSTER_AVATAR", array());
                    echo "</a>";
                } else {
                    echo $this->getAttribute($context["postrow"], "POSTER_AVATAR", array());
                }
                // line 191
                echo "\t\t\t\t";
            } else {
                // line 192
                echo "\t\t\t\t\t<a href=\"javascript:void(0)\" data-toggle=\"modal\" data-target=\"#mini";
                echo $this->getAttribute($context["postrow"], "POST_ID", array());
                echo "\" title=\"";
                echo $this->env->getExtension('phpbb')->lang("USER_MINI_PROFILE");
                echo "\"><img src=\"";
                echo (isset($context["T_THEME_PATH"]) ? $context["T_THEME_PATH"] : null);
                echo "/images/no_avatar.gif\" alt=\"\"></a>
\t\t\t\t";
            }
            // line 194
            echo "\t\t\t\t";
            if ($this->getAttribute($context["postrow"], "S_ONLINE", array())) {
                echo "<span class=\"status\"></span>";
            }
            // line 195
            echo "\t\t\t</div>
         </div>
\t\t<div class=\"side-segment\"><h3 style=\"border-bottom: 4px solid #e5e5e5;\">";
            // line 197
            if ($this->getAttribute($context["postrow"], "POST_ICON_IMG", array())) {
                echo "<img class=\"post-icon\" src=\"";
                echo (isset($context["T_ICONS_PATH"]) ? $context["T_ICONS_PATH"] : null);
                echo $this->getAttribute($context["postrow"], "POST_ICON_IMG", array());
                echo "\" width=\"";
                echo $this->getAttribute($context["postrow"], "POST_ICON_IMG_WIDTH", array());
                echo "\" height=\"";
                echo $this->getAttribute($context["postrow"], "POST_ICON_IMG_HEIGHT", array());
                echo "\" alt=\"\"/>";
            }
            echo "<a href=\"#p";
            echo $this->getAttribute($context["postrow"], "POST_ID", array());
            echo "\">";
            echo $this->getAttribute($context["postrow"], "POST_SUBJECT", array());
            echo "</a><span class=\"pull-right post-id hidden-xs\"><a href=\"";
            echo $this->getAttribute($context["postrow"], "U_MINI_POST", array());
            echo "\" title=\"";
            echo $this->env->getExtension('phpbb')->lang("POST");
            echo "\">&#35;";
            echo $this->getAttribute($context["postrow"], "POST_ID", array());
            echo "</a></span></h3></div>    
\t\t<div class=\"clearfix\">
\t\t<div class=\"text-muted";
            // line 199
            if ((((isset($context["MINI_PROFILE_POSITION"]) ? $context["MINI_PROFILE_POSITION"] : null) == "alternate") && ($this->getAttribute($context["postrow"], "S_ROW_COUNT", array()) % 2 == 1))) {
                echo " alt-odd-time";
            }
            echo " ";
            if ((((isset($context["MINI_PROFILE_POSITION"]) ? $context["MINI_PROFILE_POSITION"] : null) == "right") || (((isset($context["MINI_PROFILE_POSITION"]) ? $context["MINI_PROFILE_POSITION"] : null) == "alternate") && ($this->getAttribute($context["postrow"], "S_ROW_COUNT", array()) % 2 == 0)))) {
                echo " pull-right prof-right";
            } else {
                echo " pull-left";
            }
            echo "\">
\t\t";
            // line 200
            // line 201
            echo "\t\t";
            echo $this->env->getExtension('phpbb')->lang("BY");
            if ( !$this->getAttribute($context["postrow"], "U_POST_AUTHOR", array())) {
                echo "&nbsp;";
                echo $this->getAttribute($context["postrow"], "POST_AUTHOR_FULL", array());
            } else {
                echo "&nbsp;";
                echo $this->getAttribute($context["postrow"], "POST_AUTHOR_FULL", array());
            }
            echo "<span class=\"hidden-xs\">&nbsp;&#45;&nbsp;<i class=\"fa fa-clock-o\"></i>&nbsp;";
            echo $this->getAttribute($context["postrow"], "POST_DATE", array());
            echo "</span>\t
\t\t";
            // line 202
            // line 203
            echo "\t\t</div>
\t\t<div class=\"";
            // line 204
            if ((((isset($context["MINI_PROFILE_POSITION"]) ? $context["MINI_PROFILE_POSITION"] : null) == "right") || (((isset($context["MINI_PROFILE_POSITION"]) ? $context["MINI_PROFILE_POSITION"] : null) == "alternate") && ($this->getAttribute($context["postrow"], "S_ROW_COUNT", array()) % 2 == 0)))) {
                echo "pull-left";
            } else {
                echo "pull-right";
            }
            echo "\">
\t\t<div role=\"toolbar\" class=\"btn-toolbar\">
\t\t";
            // line 206
            // line 207
            echo "\t\t";
            // line 208
            echo "\t\t 
\t\t    ";
            // line 209
            if (( !(isset($context["S_IS_BOT"]) ? $context["S_IS_BOT"] : null) && (isset($context["S_REGISTERED_USER"]) ? $context["S_REGISTERED_USER"] : null))) {
                // line 210
                echo "\t\t\t";
                $value = ((((($this->getAttribute($context["postrow"], "U_EDIT", array()) || $this->getAttribute($context["postrow"], "U_DELETE", array())) || $this->getAttribute($context["postrow"], "U_REPORT", array())) || $this->getAttribute($context["postrow"], "U_WARN", array())) || $this->getAttribute($context["postrow"], "U_INFO", array())) || $this->getAttribute($context["postrow"], "U_QUOTE", array()));
                $context['definition']->set('SHOW_POST_BUTTONS', $value);
                // line 211
                echo "\t\t\t";
                if ($this->getAttribute((isset($context["definition"]) ? $context["definition"] : null), "SHOW_POST_BUTTONS", array())) {
                    // line 212
                    echo "                <div class=\"btn-group btn-group-sm\" role=\"group\">
\t\t\t\t  <button type=\"button\" class=\"btn btn-default dropdown-toggle\" data-toggle=\"dropdown\"><i class=\"fa fa-cog\"></i>&nbsp;<i class=\"fa fa-level-down\"></i></button>
\t\t\t\t <ul class=\"dropdown-menu";
                    // line 214
                    if ((((isset($context["MINI_PROFILE_POSITION"]) ? $context["MINI_PROFILE_POSITION"] : null) == "right") || (((isset($context["MINI_PROFILE_POSITION"]) ? $context["MINI_PROFILE_POSITION"] : null) == "alternate") && ($this->getAttribute($context["postrow"], "S_ROW_COUNT", array()) % 2 == 0)))) {
                        echo " dropdown-menu-left";
                    } else {
                        echo " dropdown-menu-right";
                    }
                    echo "\" role=\"menu\">
\t\t\t\t  ";
                    // line 215
                    // line 216
                    echo "\t\t\t\t\t";
                    if ($this->getAttribute($context["postrow"], "U_QUOTE", array())) {
                        echo "<li class=\"visible-xs\"><a href=\"";
                        echo $this->getAttribute($context["postrow"], "U_QUOTE", array());
                        echo "\" title=\"\" role=\"button\"><i class=\"fa fa-comments\"></i>&nbsp;";
                        echo $this->env->getExtension('phpbb')->lang("QUOTE");
                        echo "</a></li>";
                    }
                    // line 217
                    echo "\t\t\t\t\t";
                    if ($this->getAttribute($context["postrow"], "U_EDIT", array())) {
                        echo "<li><a href=\"";
                        echo $this->getAttribute($context["postrow"], "U_EDIT", array());
                        echo "\" title=\"\" role=\"button\" class=\"qlr-trigger\"><i class=\"fa fa-pencil\"></i>&nbsp;";
                        echo $this->env->getExtension('phpbb')->lang("EDIT_POST");
                        echo "</a></li>";
                    }
                    // line 218
                    echo "\t\t\t\t\t";
                    if ($this->getAttribute($context["postrow"], "U_DELETE", array())) {
                        echo "<li><a href=\"";
                        echo $this->getAttribute($context["postrow"], "U_DELETE", array());
                        echo "\" title=\"\" role=\"button\"><i class=\"fa fa-times\"></i>&nbsp;";
                        echo $this->env->getExtension('phpbb')->lang("DELETE_POST");
                        echo "</a></li>";
                    }
                    // line 219
                    echo "\t\t\t\t\t";
                    if ($this->getAttribute($context["postrow"], "U_REPORT", array())) {
                        echo "<li><a href=\"";
                        echo $this->getAttribute($context["postrow"], "U_REPORT", array());
                        echo "\" title=\"\" role=\"button\"><i class=\"fa fa-exclamation-circle\"></i>&nbsp;";
                        echo $this->env->getExtension('phpbb')->lang("REPORT_POST");
                        echo "</a></li>";
                    }
                    // line 220
                    echo "\t\t\t\t\t";
                    if ($this->getAttribute($context["postrow"], "U_WARN", array())) {
                        echo "<li><a href=\"";
                        echo $this->getAttribute($context["postrow"], "U_WARN", array());
                        echo "\" title=\"\" role=\"button\"><i class=\"fa fa-minus-circle\"></i>&nbsp;";
                        echo $this->env->getExtension('phpbb')->lang("WARN_USER");
                        echo "</a></li>";
                    }
                    // line 221
                    echo "\t\t\t\t\t";
                    if ($this->getAttribute($context["postrow"], "U_INFO", array())) {
                        echo "<li><a href=\"";
                        echo $this->getAttribute($context["postrow"], "U_INFO", array());
                        echo "\" title=\"\" role=\"button\"><i class=\"fa fa-info-circle\"></i>&nbsp;";
                        echo $this->env->getExtension('phpbb')->lang("INFORMATION");
                        echo "</a></li>";
                    }
                    // line 222
                    echo "\t\t\t\t  ";
                    // line 223
                    echo "\t\t\t\t </ul>
\t\t\t\t</div>
\t\t\t\t";
                    // line 225
                    if ($this->getAttribute($context["postrow"], "U_QUOTE", array())) {
                        // line 226
                        echo "                <div class=\"btn-group btn-group-sm hidden-xs visible-sm visible-md visible-lg\" role=\"group\">
                 <a class=\"btn btn-default btn-sm\" href=\"";
                        // line 227
                        echo $this->getAttribute($context["postrow"], "U_QUOTE", array());
                        echo "\" title=\"";
                        echo $this->env->getExtension('phpbb')->lang("REPLY_WITH_QUOTE");
                        echo "\" role=\"button\"><i class=\"fa fa-comments\"></i></a>
                </div>
\t\t\t\t";
                    }
                    // line 230
                    echo "\t\t\t";
                }
                // line 231
                echo "\t\t    ";
            }
            // line 232
            echo "\t\t 
\t\t";
            // line 233
            // line 234
            echo "\t\t</div>
\t\t</div>
\t\t</div>  
\t\t
\t </div>
\t</div>
\t\t\t
    <div class=\"panel-body\">
        <div class=\"clearfix\">
\t\t\t<div class=\"postbody\">
                <div id=\"post_content";
            // line 244
            echo $this->getAttribute($context["postrow"], "POST_ID", array());
            echo "\">
\t\t\t\t";
            // line 245
            // line 246
            echo "\t\t\t\t\t <span class=\"post-date pull-left visible-xs\">&#45;&nbsp;<i class=\"fa fa-clock-o\"></i>&nbsp;";
            echo $this->getAttribute($context["postrow"], "POST_DATE", array());
            echo "</span>
\t\t\t\t\t <span class=\"post-id pull-right visible-xs\"><a href=\"";
            // line 247
            echo $this->getAttribute($context["postrow"], "U_MINI_POST", array());
            echo "\" title=\"Post\" >&#35;";
            echo $this->getAttribute($context["postrow"], "POST_ID", array());
            echo "</a></span>
\t\t\t\t";
            // line 248
            // line 249
            echo "\t\t        
\t\t\t\t\t";
            // line 250
            if ($this->getAttribute($context["postrow"], "S_POST_UNAPPROVED", array())) {
                // line 251
                echo "\t\t\t\t\t<form method=\"post\" class=\"mcp_approve\" action=\"";
                echo $this->getAttribute($context["postrow"], "U_APPROVE_ACTION", array());
                echo "\">
\t\t\t\t\t\t<div class=\"alert alert-warning fade in\">
\t\t\t\t\t\t\t<button class=\"close\" data-dismiss=\"alert\"><span class=\"awe-remove-circle\"></span></button>
\t\t\t\t\t\t\t<i class=\"fa fa-warning\"></i><strong>&nbsp;";
                // line 254
                echo $this->env->getExtension('phpbb')->lang("POST_UNAPPROVED_ACTION");
                echo "</strong>
\t\t\t\t\t\t\t <input class=\"btn btn-danger btn-sm\" type=\"submit\" value=\"";
                // line 255
                echo $this->env->getExtension('phpbb')->lang("DISAPPROVE");
                echo "\" name=\"action[disapprove]\" />
\t\t\t\t\t\t\t <input class=\"btn btn-success btn-sm\" type=\"submit\" value=\"";
                // line 256
                echo $this->env->getExtension('phpbb')->lang("APPROVE");
                echo "\" name=\"action[approve]\" />
\t\t\t\t\t\t\t<input type=\"hidden\" name=\"post_id_list[]\" value=\"";
                // line 257
                echo $this->getAttribute($context["postrow"], "POST_ID", array());
                echo "\" />
\t\t\t\t\t\t\t";
                // line 258
                echo (isset($context["S_FORM_TOKEN"]) ? $context["S_FORM_TOKEN"] : null);
                echo "
\t\t\t\t\t\t</div>
\t\t\t\t\t</form>
\t\t\t\t\t";
            } elseif ($this->getAttribute(            // line 261
$context["postrow"], "S_POST_DELETED", array())) {
                // line 262
                echo "\t\t\t\t\t<form method=\"post\" class=\"mcp_approve\" action=\"";
                echo $this->getAttribute($context["postrow"], "U_APPROVE_ACTION", array());
                echo "\">
\t\t\t\t\t\t<div class=\"alert alert-warning fade in\">
\t\t\t\t\t\t\t<button class=\"close\" data-dismiss=\"alert\"><span class=\"awe-remove-circle\"></span></button>
\t\t\t\t\t\t\t<i class=\"fa fa-warning\"></i><strong>&nbsp;";
                // line 265
                echo $this->env->getExtension('phpbb')->lang("POST_DELETED_ACTION");
                echo "</strong>
\t\t\t\t\t\t\t <input class=\"btn btn-danger btn-sm\" type=\"submit\" value=\"";
                // line 266
                echo $this->env->getExtension('phpbb')->lang("DELETE");
                echo "\" name=\"action[disapprove]\" />
\t\t\t\t\t\t\t <input class=\"btn btn-success btn-sm\" type=\"submit\" value=\"";
                // line 267
                echo $this->env->getExtension('phpbb')->lang("RESTORE");
                echo "\" name=\"action[restore]\" />
\t\t\t\t\t\t\t<input type=\"hidden\" name=\"post_id_list[]\" value=\"";
                // line 268
                echo $this->getAttribute($context["postrow"], "POST_ID", array());
                echo "\" />
\t\t\t\t\t\t\t";
                // line 269
                echo (isset($context["S_FORM_TOKEN"]) ? $context["S_FORM_TOKEN"] : null);
                echo "
\t\t\t\t\t\t</div>
\t\t\t\t\t</form>
\t\t\t\t\t";
            }
            // line 273
            echo "\t\t\t\t\t
\t\t\t\t\t";
            // line 274
            if ($this->getAttribute($context["postrow"], "S_POST_REPORTED", array())) {
                // line 275
                echo "\t\t\t\t\t<div style=\"margin-top:20px;\" class=\"alert alert-danger fade in\">
\t\t\t\t\t\t<button class=\"close\" data-dismiss=\"alert\"><span class=\"awe-remove-circle\"></span></button>
\t\t\t\t\t\t<i class=\"fa fa-warning\"></i>
\t\t\t\t\t\t<a href=\"";
                // line 278
                echo $this->getAttribute($context["postrow"], "U_MCP_REPORT", array());
                echo "\"><strong>&nbsp;";
                echo $this->env->getExtension('phpbb')->lang("POST_REPORTED");
                echo "</strong></a>
\t\t\t\t\t</div>
\t\t\t\t\t";
            }
            // line 281
            echo "\t\t\t\t\t
\t\t\t\t\t<span class=\"hidden hook-bfr-message\"></span>
\t\t\t\t\t<div class=\"content\">";
            // line 283
            echo $this->getAttribute($context["postrow"], "MESSAGE", array());
            echo "</div>
\t\t\t\t\t
\t\t\t\t\t";
            // line 285
            if ($this->getAttribute($context["postrow"], "S_HAS_ATTACHMENTS", array())) {
                // line 286
                echo "\t\t\t\t\t\t<div class=\"attachbox\">
\t\t\t\t\t\t\t<h5>";
                // line 287
                echo $this->env->getExtension('phpbb')->lang("ATTACHMENTS");
                echo "</h5>
\t\t\t\t\t\t\t";
                // line 288
                $context['_parent'] = (array) $context;
                $context['_seq'] = twig_ensure_traversable($this->getAttribute($context["postrow"], "attachment", array()));
                foreach ($context['_seq'] as $context["_key"] => $context["attachment"]) {
                    // line 289
                    echo "\t\t\t\t\t\t\t\t<span>";
                    echo $this->getAttribute($context["attachment"], "DISPLAY_ATTACHMENT", array());
                    echo "</span>
\t\t\t\t\t\t\t";
                }
                $_parent = $context['_parent'];
                unset($context['_seq'], $context['_iterated'], $context['_key'], $context['attachment'], $context['_parent'], $context['loop']);
                $context = array_intersect_key($context, $_parent) + $_parent;
                // line 291
                echo "\t\t\t\t\t\t</div>
\t\t\t\t\t";
            }
            // line 293
            echo "\t\t\t\t\t
\t\t\t\t\t";
            // line 294
            // line 295
            echo "\t\t\t\t\t";
            if ($this->getAttribute($context["postrow"], "S_DISPLAY_NOTICE", array())) {
                echo "<div class=\"rules\">";
                echo $this->env->getExtension('phpbb')->lang("DOWNLOAD_NOTICE");
                echo "</div>";
            }
            // line 296
            echo "\t\t\t\t\t";
            if ((($this->getAttribute($context["postrow"], "EDITED_MESSAGE", array()) || $this->getAttribute($context["postrow"], "EDIT_REASON", array())) || $this->getAttribute($context["postrow"], "BUMPED_MESSAGE", array()))) {
                // line 297
                echo "\t\t\t\t\t\t<div class=\"notice text-muted\">
\t\t\t\t\t\t <small>";
                // line 298
                echo $this->getAttribute($context["postrow"], "EDITED_MESSAGE", array());
                echo "</small>
\t\t\t\t\t\t ";
                // line 299
                if ($this->getAttribute($context["postrow"], "EDIT_REASON", array())) {
                    echo "<small><strong>";
                    echo $this->env->getExtension('phpbb')->lang("REASON");
                    echo $this->env->getExtension('phpbb')->lang("COLON");
                    echo "</strong>&nbsp;";
                    echo $this->getAttribute($context["postrow"], "EDIT_REASON", array());
                    echo "</small>";
                }
                // line 300
                echo "\t\t\t\t\t\t <div><small>";
                echo $this->getAttribute($context["postrow"], "BUMPED_MESSAGE", array());
                echo "</small></div>
\t\t\t\t\t\t</div>
\t\t\t\t\t";
            }
            // line 303
            echo "\t\t\t\t\t";
            // line 304
            echo "\t\t\t\t\t";
            if ($this->getAttribute($context["postrow"], "SIGNATURE", array())) {
                // line 305
                echo "\t\t\t\t\t <div class=\"clearfix\"></div>
\t\t\t\t\t <p class=\"separator text-center hidden-xs\"><i class=\"fa fa-ellipsis-h fa-2x\"></i></p>
\t\t\t\t\t <div id=\"sig";
                // line 307
                echo $this->getAttribute($context["postrow"], "POST_ID", array());
                echo "\" class=\"hidden-xs post-signature\">";
                echo $this->getAttribute($context["postrow"], "SIGNATURE", array());
                echo "</div>
\t\t\t\t\t";
            }
            // line 308
            echo "\t
                </div>
\t\t\t\t";
            // line 310
            // line 311
            echo "\t\t\t</div>
        </div>
    </div>

\t";
            // line 315
            if (($this->getAttribute($context["postrow"], "S_LAST_ROW", array()) && (isset($context["S_QUICK_REPLY"]) ? $context["S_QUICK_REPLY"] : null))) {
                // line 316
                echo "\t <div class=\"panel-footer\">
\t\t <div class=\"clearfix\">
            <div class=\"text-center\">
\t\t\t<div id=\"hidden-div\">
             <button id=\"show_button\" class=\"btn btn-primary btn-sm collapsed\" data-toggle=\"collapse\" data-target=\".quick-reply\"><i class=\"glyphicon glyphicon-edit\"></i> ";
                // line 320
                echo $this->env->getExtension('phpbb')->lang("QUICKREPLY");
                echo "</a>
            </div>
\t\t\t</div>
            <div class=\"text-center\">
                <div class=\"quick-reply collapse\">
\t\t\t\t\t";
                // line 325
                if ((isset($context["S_SNAPPY"]) ? $context["S_SNAPPY"] : null)) {
                    $location = "@sitesplat_snappy/snappy_quickreply_editor.html";
                    $namespace = false;
                    if (strpos($location, '@') === 0) {
                        $namespace = substr($location, 1, strpos($location, '/') - 1);
                        $previous_look_up_order = $this->env->getNamespaceLookUpOrder();
                        $this->env->setNamespaceLookUpOrder(array($namespace, '__main__'));
                    }
                    $this->loadTemplate("@sitesplat_snappy/snappy_quickreply_editor.html", "viewtopic_body.html", 325)->display($context);
                    if ($namespace) {
                        $this->env->setNamespaceLookUpOrder($previous_look_up_order);
                    }
                } else {
                    $location = "quickreply_editor.html";
                    $namespace = false;
                    if (strpos($location, '@') === 0) {
                        $namespace = substr($location, 1, strpos($location, '/') - 1);
                        $previous_look_up_order = $this->env->getNamespaceLookUpOrder();
                        $this->env->setNamespaceLookUpOrder(array($namespace, '__main__'));
                    }
                    $this->loadTemplate("quickreply_editor.html", "viewtopic_body.html", 325)->display($context);
                    if ($namespace) {
                        $this->env->setNamespaceLookUpOrder($previous_look_up_order);
                    }
                }
                // line 326
                echo "                </div>
            </div>
          </div>
\t </div>
\t ";
            }
            // line 331
            echo "\t ";
            // line 332
            echo "  </div>
  
 </article>
 
 <!-- /.MODAL PROFILE POSTER STARTS HERE -->
    <div class=\"modal fade\" id=\"mini";
            // line 337
            echo $this->getAttribute($context["postrow"], "POST_ID", array());
            echo "\" tabindex=\"-1\" role=\"dialog\" aria-hidden=\"true\">
\t <div class=\"modal-dialog\">
\t  <div class=\"modal-content\">
\t\t<div class=\"modal-header\">
\t\t\t<button type=\"button\" class=\"close\" data-dismiss=\"modal\" aria-hidden=\"true\"><span class=\"awe-remove-circle\"></span></button>
\t\t\t<h4 class=\"modal-title\">";
            // line 342
            echo $this->env->getExtension('phpbb')->lang("USER_MINI_PROFILE");
            echo "</h4>
\t\t</div>
\t\t<div class=\"modal-body\">
\t\t\t<div class=\"row profile-data\">
\t\t\t<!-- Left Side Start -->
\t\t\t\t<div class=\"col-lg-4 col-md-4 col-sm-3 col-xs-12 text-center\">
\t\t\t\t    <!-- Profile Avatar Start -->
\t\t\t\t\t<div class=\"profile-avatar\">
\t\t\t\t\t\t";
            // line 350
            // line 351
            echo "\t\t\t\t\t\t";
            if ($this->getAttribute($context["postrow"], "POSTER_AVATAR", array())) {
                // line 352
                echo "\t\t\t\t\t\t";
                if ($this->getAttribute($context["postrow"], "U_POST_AUTHOR", array())) {
                    echo "<a href=\"";
                    echo $this->getAttribute($context["postrow"], "U_POST_AUTHOR", array());
                    echo "\">";
                    echo $this->getAttribute($context["postrow"], "POSTER_AVATAR", array());
                    echo "</a>";
                } else {
                    echo $this->getAttribute($context["postrow"], "POSTER_AVATAR", array());
                }
                // line 353
                echo "\t\t\t\t\t    ";
            } else {
                // line 354
                echo "\t\t\t\t\t\t<img src=\"";
                echo (isset($context["T_THEME_PATH"]) ? $context["T_THEME_PATH"] : null);
                echo "/images/no_avatar.gif\" alt=\"\">
\t\t\t\t\t\t";
            }
            // line 356
            echo "\t\t\t\t\t\t";
            echo "\t
\t\t\t\t\t</div>
\t\t\t\t\t<!-- Profile Avatar End -->  
                ";
            // line 359
            echo "\t\t\t\t\t
\t\t\t\t\t";
            // line 360
            if (($this->getAttribute($context["postrow"], "RANK_TITLE", array()) && $this->getAttribute($context["postrow"], "RANK_IMG", array()))) {
                // line 361
                echo "\t\t\t\t\t<div class=\"profile-rank text-center\">";
                echo $this->getAttribute($context["postrow"], "RANK_IMG", array());
                echo "</div>
\t\t\t\t\t";
            }
            // line 362
            echo "\t
\t\t\t\t";
            // line 363
            echo "\t
\t\t\t\t\t";
            // line 364
            if ($this->getAttribute($context["postrow"], "U_POST_AUTHOR", array())) {
                // line 365
                echo "\t\t\t\t\t<a class=\"btn btn-sm btn-default\" title=\"\" href=\"";
                echo $this->getAttribute($context["postrow"], "U_POST_AUTHOR", array());
                echo "\">";
                echo $this->env->getExtension('phpbb')->lang("USER_MINI_PROFILE_VIEW_FULL");
                echo "</a>
\t\t\t\t\t";
            }
            // line 367
            echo "\t\t\t\t</div>
\t\t\t\t<!-- Left Side End -->
\t\t\t\t<!-- Right Side Start -->
\t\t\t\t<div class=\"col-lg-8 col-md-8 col-sm-9 col-xs-12\">
\t\t\t\t <h3>";
            // line 371
            if ( !$this->getAttribute($context["postrow"], "U_POST_AUTHOR", array())) {
                echo $this->getAttribute($context["postrow"], "POST_AUTHOR_FULL", array());
            } else {
                echo $this->getAttribute($context["postrow"], "POST_AUTHOR_FULL", array());
            }
            echo "</h3>\t\t\t\t\t\t 
\t\t\t\t\t<ul class=\"icon-list list-unstyled\">
\t\t\t\t\t ";
            // line 373
            if (($this->getAttribute($context["postrow"], "RANK_TITLE", array()) || $this->getAttribute($context["postrow"], "RANK_IMG", array()))) {
                echo "<li><i class=\"fa fa-sitemap\"></i>&nbsp;";
                echo $this->env->getExtension('phpbb')->lang("RANK");
                echo $this->env->getExtension('phpbb')->lang("COLON");
                echo "&nbsp;";
                echo $this->getAttribute($context["postrow"], "RANK_TITLE", array());
                echo "</li>";
            }
            // line 374
            echo "\t\t\t\t\t ";
            if (($this->getAttribute($context["postrow"], "POSTER_POSTS", array()) != "")) {
                echo "<li><i class=\"fa fa-comments\"></i>&nbsp;";
                echo $this->env->getExtension('phpbb')->lang("POSTS");
                echo $this->env->getExtension('phpbb')->lang("COLON");
                echo "&nbsp;";
                echo $this->getAttribute($context["postrow"], "POSTER_POSTS", array());
                echo "</li>";
            }
            // line 375
            echo "\t\t\t\t\t ";
            if ($this->getAttribute($context["postrow"], "POSTER_JOINED", array())) {
                echo "<li><i class=\"fa fa-calendar\"></i>&nbsp;";
                echo $this->env->getExtension('phpbb')->lang("JOINED");
                echo $this->env->getExtension('phpbb')->lang("COLON");
                echo "&nbsp;";
                echo $this->getAttribute($context["postrow"], "POSTER_JOINED", array());
                echo "</li>";
            }
            // line 376
            echo "\t\t\t\t\t <li><i class=\"fa fa-retweet\"></i>&nbsp;";
            echo $this->env->getExtension('phpbb')->lang("USER_STATUS");
            echo $this->env->getExtension('phpbb')->lang("COLON");
            echo "&nbsp;";
            if (($this->getAttribute($context["postrow"], "S_ONLINE", array()) &&  !$this->getAttribute($context["postrow"], "S_IGNORE_POST", array()))) {
                echo $this->env->getExtension('phpbb')->lang("ONLINE");
            } else {
                echo $this->env->getExtension('phpbb')->lang("OFF_LINE");
            }
            echo "</li>
                     ";
            // line 377
            if ($this->getAttribute($context["postrow"], "POSTER_WARNINGS", array())) {
                echo "<li><i class=\"fa fa-bolt\"></i>&nbsp;";
                echo $this->env->getExtension('phpbb')->lang("WARNINGS");
                echo $this->env->getExtension('phpbb')->lang("COLON");
                echo "&nbsp;";
                echo $this->getAttribute($context["postrow"], "POSTER_WARNINGS", array());
                echo "</li>";
            }
            // line 378
            echo "\t\t\t\t\t\t\t\t
\t\t\t\t\t ";
            // line 379
            if ($this->getAttribute($context["postrow"], "S_PROFILE_FIELD1", array())) {
                // line 380
                echo "\t\t\t\t\t <!-- Use a construct like this to include admin defined profile fields. Replace FIELD1 with the name of your field. -->
\t\t\t\t\t <li><i class=\"fa fa-star\"></i> 
\t\t\t\t\t ";
                // line 382
                echo $this->getAttribute($context["postrow"], "PROFILE_FIELD1_NAME", array());
                echo $this->env->getExtension('phpbb')->lang("COLON");
                echo "&nbsp;";
                echo $this->getAttribute($context["postrow"], "PROFILE_FIELD1_VALUE", array());
                echo "
\t\t\t\t\t </li>
\t\t\t\t\t ";
            }
            // line 385
            echo "
\t\t\t\t\t";
            // line 386
            // line 387
            echo "\t\t\t\t\t";
            $context['_parent'] = (array) $context;
            $context['_seq'] = twig_ensure_traversable($this->getAttribute($context["postrow"], "custom_fields", array()));
            foreach ($context['_seq'] as $context["_key"] => $context["custom_fields"]) {
                // line 388
                echo "\t\t\t\t\t\t";
                if ( !$this->getAttribute($context["custom_fields"], "S_PROFILE_CONTACT", array())) {
                    // line 389
                    echo "\t\t\t\t\t\t <li class=\"profile-custom-field profile-";
                    echo $this->getAttribute($context["custom_fields"], "PROFILE_FIELD_IDENT", array());
                    echo "\"><i class=\"fa fa-star\"></i>&nbsp;";
                    echo $this->getAttribute($context["custom_fields"], "PROFILE_FIELD_NAME", array());
                    echo $this->env->getExtension('phpbb')->lang("COLON");
                    echo " ";
                    echo $this->getAttribute($context["custom_fields"], "PROFILE_FIELD_VALUE", array());
                    echo "</li>
\t\t\t\t\t\t";
                }
                // line 391
                echo "\t\t\t\t\t";
            }
            $_parent = $context['_parent'];
            unset($context['_seq'], $context['_iterated'], $context['_key'], $context['custom_fields'], $context['_parent'], $context['loop']);
            $context = array_intersect_key($context, $_parent) + $_parent;
            // line 392
            echo "\t\t\t\t\t";
            // line 393
            echo "\t\t\t\t\t</ul>
\t\t\t\t</div>
\t\t\t <!-- Right Side End -->
            </div>
\t\t</div>
\t\t<div class=\"modal-footer\">
\t\t    ";
            // line 399
            // line 400
            echo "\t\t\t ";
            if (( !(isset($context["S_IS_BOT"]) ? $context["S_IS_BOT"] : null) && twig_length_filter($this->env, $this->getAttribute($context["postrow"], "contact", array())))) {
                // line 401
                echo "\t\t\t<div class=\"clearfix\">
\t\t\t\t<ul class=\"mini-profile-contact\">
\t\t\t\t";
                // line 403
                $context['_parent'] = (array) $context;
                $context['_seq'] = twig_ensure_traversable($this->getAttribute($context["postrow"], "contact", array()));
                foreach ($context['_seq'] as $context["_key"] => $context["contact"]) {
                    // line 404
                    echo "\t\t\t\t ";
                    $context["REMAINDER"] = ($this->getAttribute($context["contact"], "S_ROW_COUNT", array()) % 4);
                    // line 405
                    echo "\t\t\t\t";
                    $value = (((isset($context["REMAINDER"]) ? $context["REMAINDER"] : null) == 3) || ($this->getAttribute($context["contact"], "S_LAST_ROW", array()) && ($this->getAttribute($context["contact"], "S_NUM_ROWS", array()) < 4)));
                    $context['definition']->set('S_LAST_CELL', $value);
                    // line 406
                    echo "\t\t\t\t";
                    if (((isset($context["REMAINDER"]) ? $context["REMAINDER"] : null) == 0)) {
                        // line 407
                        echo "\t\t\t\t";
                    }
                    // line 408
                    echo "\t\t\t\t<li><a class=\"default-contact\" href=\"";
                    if ($this->getAttribute($context["contact"], "U_CONTACT", array())) {
                        echo $this->getAttribute($context["contact"], "U_CONTACT", array());
                    } else {
                        echo $this->getAttribute($context["postrow"], "U_POST_AUTHOR", array());
                    }
                    echo "\" title=\"";
                    echo $this->getAttribute($context["contact"], "NAME", array());
                    echo "\"";
                    if (($this->getAttribute($context["contact"], "ID", array()) == "jabber")) {
                        echo " onclick=\"popup(this.href, 750, 320); return false;\"";
                    }
                    echo ">
\t\t\t\t <i class=\"icon-moon-";
                    // line 409
                    echo $this->getAttribute($context["contact"], "ID", array());
                    echo "\"></i>
\t\t\t\t </a>
\t\t\t\t</li>
\t\t\t\t";
                    // line 412
                    if ((((isset($context["REMAINDER"]) ? $context["REMAINDER"] : null) == 3) || $this->getAttribute($context["contact"], "S_LAST_ROW", array()))) {
                        // line 413
                        echo "\t\t\t\t";
                    }
                    // line 414
                    echo "\t\t\t\t";
                }
                $_parent = $context['_parent'];
                unset($context['_seq'], $context['_iterated'], $context['_key'], $context['contact'], $context['_parent'], $context['loop']);
                $context = array_intersect_key($context, $_parent) + $_parent;
                // line 415
                echo "\t\t\t\t</ul>
\t\t\t</div>
\t\t\t";
            }
            // line 418
            echo "\t\t\t";
            // line 419
            echo "\t\t</div>
\t   </div><!-- /.modal-content -->
\t </div><!-- /.modal-dialog -->
\t</div><!-- /.modal -->
 <!-- /.MODAL PROFILE POSTER STOPS HERE -->
 
</div>
";
            // line 426
            ++$context['loop']['index0'];
            ++$context['loop']['index'];
            $context['loop']['first'] = false;
            if (isset($context['loop']['length'])) {
                --$context['loop']['revindex0'];
                --$context['loop']['revindex'];
                $context['loop']['last'] = 0 === $context['loop']['revindex0'];
            }
        }
        $_parent = $context['_parent'];
        unset($context['_seq'], $context['_iterated'], $context['_key'], $context['postrow'], $context['_parent'], $context['loop']);
        $context = array_intersect_key($context, $_parent) + $_parent;
        // line 428
        echo "

<div class=\"clearfix\">
 ";
        // line 431
        // line 432
        echo "  <div class=\"pull-left\">
   \t";
        // line 433
        if (( !(isset($context["S_IS_BOT"]) ? $context["S_IS_BOT"] : null) && (isset($context["S_DISPLAY_REPLY_INFO"]) ? $context["S_DISPLAY_REPLY_INFO"] : null))) {
            // line 434
            echo "\t ";
            // line 435
            echo "\t";
            if ((isset($context["S_IS_LOCKED"]) ? $context["S_IS_LOCKED"] : null)) {
                // line 436
                echo "     <a class=\"btn btn-danger\" href=\"";
                echo (isset($context["U_POST_REPLY_TOPIC"]) ? $context["U_POST_REPLY_TOPIC"] : null);
                echo "\" role=\"button\"><i class=\"fa fa-lock\"></i>&nbsp;";
                echo $this->env->getExtension('phpbb')->lang("TOPIC_LOCKED_SHORT");
                echo "</a>
\t";
            } else {
                // line 438
                echo "\t <a class=\"btn btn-default btn-load\" href=\"";
                echo (isset($context["U_POST_REPLY_TOPIC"]) ? $context["U_POST_REPLY_TOPIC"] : null);
                echo "\" role=\"button\" data-loading-text=\"";
                echo $this->env->getExtension('phpbb')->lang("LOADING");
                echo "&nbsp;<i class='fa-spin fa fa-spinner fa-lg icon-white'></i>\"><i class=\"fa fa-plus\"></i>&nbsp;";
                echo $this->env->getExtension('phpbb')->lang("REPLY");
                echo "</a>
    ";
            }
            // line 440
            echo "\t ";
            // line 441
            echo "\t";
        }
        // line 442
        echo "  </div>

 <div class=\"pull-right\">
     <ul class=\"pagination pagination-sm hidden-xs\">
\t ";
        // line 446
        if (twig_length_filter($this->env, $this->getAttribute((isset($context["loops"]) ? $context["loops"] : null), "quickmod", array()))) {
            echo "<li><a title=\"\" href=\"javascript:void(0);\" data-target=\".sorting-topic-mod\" data-toggle=\"collapse\">";
            echo $this->env->getExtension('phpbb')->lang("MODERATOR_OPTIONS");
            echo "</a></li>";
        }
        // line 447
        echo "\t";
        if ((((isset($context["S_NUM_POSTS"]) ? $context["S_NUM_POSTS"] : null) > 1) || twig_length_filter($this->env, $this->getAttribute((isset($context["loops"]) ? $context["loops"] : null), "pagination", array())))) {
            echo "<li><a title=\"\" href=\"javascript:void(0);\" data-target=\".sorting\" data-toggle=\"collapse\">";
            echo $this->env->getExtension('phpbb')->lang("OPTIONS");
            echo "</a></li>";
        }
        echo "\t\t\t\t
     ";
        // line 448
        if ((twig_length_filter($this->env, $this->getAttribute((isset($context["loops"]) ? $context["loops"] : null), "pagination", array())) || (isset($context["TOTAL_POSTS"]) ? $context["TOTAL_POSTS"] : null))) {
            // line 449
            echo "\t  <li class=\"active\"><a>";
            echo (isset($context["TOTAL_POSTS"]) ? $context["TOTAL_POSTS"] : null);
            echo "</a></li>
\t\t\t";
            // line 450
            $location = "pagination.html";
            $namespace = false;
            if (strpos($location, '@') === 0) {
                $namespace = substr($location, 1, strpos($location, '/') - 1);
                $previous_look_up_order = $this->env->getNamespaceLookUpOrder();
                $this->env->setNamespaceLookUpOrder(array($namespace, '__main__'));
            }
            $this->loadTemplate("pagination.html", "viewtopic_body.html", 450)->display($context);
            if ($namespace) {
                $this->env->setNamespaceLookUpOrder($previous_look_up_order);
            }
            // line 451
            echo "\t\t";
        } else {
            // line 452
            echo "\t\t\t<li class=\"active\"><a>";
            echo (isset($context["PAGE_NUMBER"]) ? $context["PAGE_NUMBER"] : null);
            echo "</a></li>\t
\t ";
        }
        // line 454
        echo "     </ul>
\t 
\t<div class=\"visible-xs\"> 
\t<ul class=\"pagination pagination-sm\">
\t ";
        // line 458
        if (twig_length_filter($this->env, $this->getAttribute((isset($context["loops"]) ? $context["loops"] : null), "quickmod", array()))) {
            echo "<li><a title=\"\" href=\"javascript:void(0);\" data-target=\".sorting-topic-mod\" data-toggle=\"collapse\"><i class=\"fa fa-gavel\"></i></a></li>";
        }
        // line 459
        echo "\t ";
        if ((((isset($context["S_NUM_POSTS"]) ? $context["S_NUM_POSTS"] : null) > 1) || twig_length_filter($this->env, $this->getAttribute((isset($context["loops"]) ? $context["loops"] : null), "pagination", array())))) {
            echo "<li><a title=\"\" href=\"javascript:void(0);\" data-target=\".sorting\" data-toggle=\"collapse\"><i class=\"fa fa-cog\"></i></a></li>";
        }
        echo "\t\t\t\t
\t <li><a class=\"pagination-trigger\" data-placement=\"top\">";
        // line 460
        echo (isset($context["PAGE_NUMBER"]) ? $context["PAGE_NUMBER"] : null);
        echo "</a></li>
\t <li class=\"active\"><a>";
        // line 461
        echo (isset($context["TOTAL_POSTS"]) ? $context["TOTAL_POSTS"] : null);
        echo "</a></li>
\t</ul>
\t</div>
 </div>
</div>

<div class=\"clearfix\">
   <div class=\"pull-right\">
\t<div class=\"visible-xs\"> 
\t <ul class=\"pagination pagination-sm\">
\t ";
        // line 471
        if ((twig_length_filter($this->env, $this->getAttribute((isset($context["loops"]) ? $context["loops"] : null), "pagination", array())) || (isset($context["TOTAL_POSTS"]) ? $context["TOTAL_POSTS"] : null))) {
            // line 472
            echo "\t\t\t";
            $location = "pagination_mobile.html";
            $namespace = false;
            if (strpos($location, '@') === 0) {
                $namespace = substr($location, 1, strpos($location, '/') - 1);
                $previous_look_up_order = $this->env->getNamespaceLookUpOrder();
                $this->env->setNamespaceLookUpOrder(array($namespace, '__main__'));
            }
            $this->loadTemplate("pagination_mobile.html", "viewtopic_body.html", 472)->display($context);
            if ($namespace) {
                $this->env->setNamespaceLookUpOrder($previous_look_up_order);
            }
            // line 473
            echo "\t\t";
        } else {
            // line 474
            echo "\t\t\t<li class=\"active\"><a>";
            echo (isset($context["PAGE_NUMBER"]) ? $context["PAGE_NUMBER"] : null);
            echo "</a></li>\t
\t ";
        }
        // line 476
        echo "\t </ul>
\t</div>
   </div>
</div>

";
        // line 481
        $location = "jump_links.html";
        $namespace = false;
        if (strpos($location, '@') === 0) {
            $namespace = substr($location, 1, strpos($location, '/') - 1);
            $previous_look_up_order = $this->env->getNamespaceLookUpOrder();
            $this->env->setNamespaceLookUpOrder(array($namespace, '__main__'));
        }
        $this->loadTemplate("jump_links.html", "viewtopic_body.html", 481)->display($context);
        if ($namespace) {
            $this->env->setNamespaceLookUpOrder($previous_look_up_order);
        }
        // line 482
        echo "<div class=\"space10\"></div>

";
        // line 484
        if ((((isset($context["S_NUM_POSTS"]) ? $context["S_NUM_POSTS"] : null) > 1) || twig_length_filter($this->env, $this->getAttribute((isset($context["loops"]) ? $context["loops"] : null), "pagination", array())))) {
            // line 485
            echo "\t<div class=\"controls-row\">
        <div class=\"sorting collapse\">
\t\t\t<div class=\"panel panel-default\">
\t\t\t\t<div class=\"panel-body\">
                   <div class=\"row\">
\t\t\t\t\t<form class=\"form-horizontal\" method=\"post\" action=\"";
            // line 490
            echo (isset($context["S_TOPIC_ACTION"]) ? $context["S_TOPIC_ACTION"] : null);
            echo "\">
\t\t\t\t\t\t<div class=\"col-md-3 col-sm-3\"> 
                         <label for=\"st\">";
            // line 492
            echo $this->env->getExtension('phpbb')->lang("DISPLAY");
            echo $this->env->getExtension('phpbb')->lang("COLON");
            echo "</label>
                            <div class=\"control-row\">
                              ";
            // line 494
            echo (isset($context["S_SELECT_SORT_DAYS"]) ? $context["S_SELECT_SORT_DAYS"] : null);
            echo "
                            </div>
\t\t\t\t\t\t</div>
\t 
\t                    <div class=\"col-md-3 col-sm-3\"> 
                          <label for=\"sk\">";
            // line 499
            echo $this->env->getExtension('phpbb')->lang("SORT_BY");
            echo $this->env->getExtension('phpbb')->lang("COLON");
            echo "</label>
                            <div class=\"control-row\">
                              ";
            // line 501
            echo (isset($context["S_SELECT_SORT_KEY"]) ? $context["S_SELECT_SORT_KEY"] : null);
            echo "
                            </div>
\t\t\t\t\t\t</div>
\t\t\t\t\t\t\t\t\t\t\t
\t\t\t\t\t\t<div class=\"col-md-3 col-sm-3\">  
                           <label for=\"sd\">";
            // line 506
            echo $this->env->getExtension('phpbb')->lang("SORT_BY");
            echo $this->env->getExtension('phpbb')->lang("COLON");
            echo "</label>
                            <div class=\"control-row\">
\t\t\t\t\t\t\t<div class=\"input-group\">
                             ";
            // line 509
            echo (isset($context["S_SELECT_SORT_DIR"]) ? $context["S_SELECT_SORT_DIR"] : null);
            echo "
\t\t\t\t\t\t\t <span class=\"input-group-btn\">
                              <button class=\"btn btn-default\" name=\"sort\" type=\"submit\">";
            // line 511
            echo $this->env->getExtension('phpbb')->lang("GO");
            echo "</button>
\t\t\t\t\t\t\t</span>
\t\t\t\t\t\t\t</div>
\t\t\t\t\t\t    </div>   
\t\t\t\t\t\t</div>
\t\t\t\t\t</form>

\t\t\t\t\t<div class=\"col-md-3 col-sm-3\"> 
                      <label accesskey=\"j\">";
            // line 519
            echo $this->env->getExtension('phpbb')->lang("JUMP_TO");
            echo $this->env->getExtension('phpbb')->lang("COLON");
            echo "</label>
                       <div class=\"control-row\">
                         ";
            // line 521
            $location = "jumpbox_options.html";
            $namespace = false;
            if (strpos($location, '@') === 0) {
                $namespace = substr($location, 1, strpos($location, '/') - 1);
                $previous_look_up_order = $this->env->getNamespaceLookUpOrder();
                $this->env->setNamespaceLookUpOrder(array($namespace, '__main__'));
            }
            $this->loadTemplate("jumpbox_options.html", "viewtopic_body.html", 521)->display($context);
            if ($namespace) {
                $this->env->setNamespaceLookUpOrder($previous_look_up_order);
            }
            // line 522
            echo "                       </div>
\t\t\t\t\t</div>
\t\t\t\t\t
                   </div>
                </div>
\t\t\t</div>
\t\t</div>
        <!-- // Widget --> 
\t</div> 
";
        }
        // line 532
        echo "
";
        // line 533
        if (twig_length_filter($this->env, $this->getAttribute((isset($context["loops"]) ? $context["loops"] : null), "quickmod", array()))) {
            // line 534
            echo "\t<div class=\"controls-row\">
       <div class=\"sorting-topic-mod collapse\">
\t\t\t<div class=\"panel panel-default\">
\t\t\t\t<div class=\"panel-body\">
                   <div class=\"row\">
\t\t\t\t\t    <div class=\"col-md-6 col-sm-6\"> 
                         <label for=\"f\" accesskey=\"j\">";
            // line 540
            echo $this->env->getExtension('phpbb')->lang("JUMP_TO");
            echo $this->env->getExtension('phpbb')->lang("COLON");
            echo "</label>
                            <div class=\"control-row\">
                              ";
            // line 542
            $location = "jumpbox_options.html";
            $namespace = false;
            if (strpos($location, '@') === 0) {
                $namespace = substr($location, 1, strpos($location, '/') - 1);
                $previous_look_up_order = $this->env->getNamespaceLookUpOrder();
                $this->env->setNamespaceLookUpOrder(array($namespace, '__main__'));
            }
            $this->loadTemplate("jumpbox_options.html", "viewtopic_body.html", 542)->display($context);
            if ($namespace) {
                $this->env->setNamespaceLookUpOrder($previous_look_up_order);
            }
            // line 543
            echo "                            </div>
\t\t\t\t\t\t</div>
\t                    <div class=\"col-md-6 col-sm-6\"> 
\t\t\t\t\t\t <label for=\"quick-mod-select\">";
            // line 546
            echo $this->env->getExtension('phpbb')->lang("QUICK_MOD");
            echo $this->env->getExtension('phpbb')->lang("COLON");
            echo "</label>
                          ";
            // line 547
            $location = "quickmod_tools.html";
            $namespace = false;
            if (strpos($location, '@') === 0) {
                $namespace = substr($location, 1, strpos($location, '/') - 1);
                $previous_look_up_order = $this->env->getNamespaceLookUpOrder();
                $this->env->setNamespaceLookUpOrder(array($namespace, '__main__'));
            }
            $this->loadTemplate("quickmod_tools.html", "viewtopic_body.html", 547)->display($context);
            if ($namespace) {
                $this->env->setNamespaceLookUpOrder($previous_look_up_order);
            }
            // line 548
            echo "\t\t\t\t\t\t</div>
                    </div>
                </div>
\t\t\t</div>
\t\t</div>
\t</div> 
";
        }
        // line 555
        echo "
";
        // line 556
        // line 557
        echo "
";
        // line 558
        if ((isset($context["S_USER_LOGGED_IN"]) ? $context["S_USER_LOGGED_IN"] : null)) {
            // line 559
            echo "<div class=\"row\">
";
            // line 560
            if ((isset($context["S_DISPLAY_ONLINE_LIST"]) ? $context["S_DISPLAY_ONLINE_LIST"] : null)) {
                // line 561
                echo "<div class=\"col-xs-12 col-sm-12 col-md-12 col-lg-6\">
<div class=\"panel panel-forum\">
<div class=\"panel-heading\"><i class=\"fa fa-users\"></i> ";
                // line 563
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
                // line 565
                echo (isset($context["LOGGED_IN_USER_LIST"]) ? $context["LOGGED_IN_USER_LIST"] : null);
                echo "</p>
 </div> 
</div> 
</div> 
";
            }
            // line 570
            echo "
";
            // line 571
            if ((isset($context["S_DISPLAY_POST_INFO"]) ? $context["S_DISPLAY_POST_INFO"] : null)) {
                // line 572
                echo "<div class=\"col-xs-12 col-sm-12 col-md-12 col-lg-6\">
<div class=\"panel panel-forum\">
<div class=\"panel-heading\"><i class=\"fa fa-bar-chart-o\"></i>&nbsp;";
                // line 574
                echo $this->env->getExtension('phpbb')->lang("TOPIC_PERMISSIONS");
                echo "</div>
  <div class=\"panel-body\">
\t<p>";
                // line 576
                $context['_parent'] = (array) $context;
                $context['_seq'] = twig_ensure_traversable($this->getAttribute((isset($context["loops"]) ? $context["loops"] : null), "rules", array()));
                foreach ($context['_seq'] as $context["_key"] => $context["rules"]) {
                    echo $this->getAttribute($context["rules"], "RULE", array());
                    echo "<br />";
                }
                $_parent = $context['_parent'];
                unset($context['_seq'], $context['_iterated'], $context['_key'], $context['rules'], $context['_parent'], $context['loop']);
                $context = array_intersect_key($context, $_parent) + $_parent;
                echo "</p>
  </div> 
</div> 
 </div>
";
            }
            // line 581
            echo "</div>
";
        }
        // line 583
        $location = "overall_footer.html";
        $namespace = false;
        if (strpos($location, '@') === 0) {
            $namespace = substr($location, 1, strpos($location, '/') - 1);
            $previous_look_up_order = $this->env->getNamespaceLookUpOrder();
            $this->env->setNamespaceLookUpOrder(array($namespace, '__main__'));
        }
        $this->loadTemplate("overall_footer.html", "viewtopic_body.html", 583)->display($context);
        if ($namespace) {
            $this->env->setNamespaceLookUpOrder($previous_look_up_order);
        }
    }

    public function getTemplateName()
    {
        return "viewtopic_body.html";
    }

    public function isTraitable()
    {
        return false;
    }

    public function getDebugInfo()
    {
        return array (  1800 => 583,  1796 => 581,  1780 => 576,  1775 => 574,  1771 => 572,  1769 => 571,  1766 => 570,  1758 => 565,  1745 => 563,  1741 => 561,  1739 => 560,  1736 => 559,  1734 => 558,  1731 => 557,  1730 => 556,  1727 => 555,  1718 => 548,  1706 => 547,  1701 => 546,  1696 => 543,  1684 => 542,  1678 => 540,  1670 => 534,  1668 => 533,  1665 => 532,  1653 => 522,  1641 => 521,  1635 => 519,  1624 => 511,  1619 => 509,  1612 => 506,  1604 => 501,  1598 => 499,  1590 => 494,  1584 => 492,  1579 => 490,  1572 => 485,  1570 => 484,  1566 => 482,  1554 => 481,  1547 => 476,  1541 => 474,  1538 => 473,  1525 => 472,  1523 => 471,  1510 => 461,  1506 => 460,  1499 => 459,  1495 => 458,  1489 => 454,  1483 => 452,  1480 => 451,  1468 => 450,  1463 => 449,  1461 => 448,  1452 => 447,  1446 => 446,  1440 => 442,  1437 => 441,  1435 => 440,  1425 => 438,  1417 => 436,  1414 => 435,  1412 => 434,  1410 => 433,  1407 => 432,  1406 => 431,  1401 => 428,  1388 => 426,  1379 => 419,  1377 => 418,  1372 => 415,  1366 => 414,  1363 => 413,  1361 => 412,  1355 => 409,  1340 => 408,  1337 => 407,  1334 => 406,  1330 => 405,  1327 => 404,  1323 => 403,  1319 => 401,  1316 => 400,  1315 => 399,  1307 => 393,  1305 => 392,  1299 => 391,  1288 => 389,  1285 => 388,  1280 => 387,  1279 => 386,  1276 => 385,  1267 => 382,  1263 => 380,  1261 => 379,  1258 => 378,  1249 => 377,  1237 => 376,  1227 => 375,  1217 => 374,  1208 => 373,  1199 => 371,  1193 => 367,  1185 => 365,  1183 => 364,  1180 => 363,  1177 => 362,  1171 => 361,  1169 => 360,  1166 => 359,  1160 => 356,  1154 => 354,  1151 => 353,  1140 => 352,  1137 => 351,  1136 => 350,  1125 => 342,  1117 => 337,  1110 => 332,  1108 => 331,  1101 => 326,  1075 => 325,  1067 => 320,  1061 => 316,  1059 => 315,  1053 => 311,  1052 => 310,  1048 => 308,  1041 => 307,  1037 => 305,  1034 => 304,  1032 => 303,  1025 => 300,  1016 => 299,  1012 => 298,  1009 => 297,  1006 => 296,  999 => 295,  998 => 294,  995 => 293,  991 => 291,  982 => 289,  978 => 288,  974 => 287,  971 => 286,  969 => 285,  964 => 283,  960 => 281,  952 => 278,  947 => 275,  945 => 274,  942 => 273,  935 => 269,  931 => 268,  927 => 267,  923 => 266,  919 => 265,  912 => 262,  910 => 261,  904 => 258,  900 => 257,  896 => 256,  892 => 255,  888 => 254,  881 => 251,  879 => 250,  876 => 249,  875 => 248,  869 => 247,  864 => 246,  863 => 245,  859 => 244,  847 => 234,  846 => 233,  843 => 232,  840 => 231,  837 => 230,  829 => 227,  826 => 226,  824 => 225,  820 => 223,  818 => 222,  809 => 221,  800 => 220,  791 => 219,  782 => 218,  773 => 217,  764 => 216,  763 => 215,  755 => 214,  751 => 212,  748 => 211,  744 => 210,  742 => 209,  739 => 208,  737 => 207,  736 => 206,  727 => 204,  724 => 203,  723 => 202,  709 => 201,  708 => 200,  696 => 199,  672 => 197,  668 => 195,  663 => 194,  653 => 192,  650 => 191,  637 => 190,  635 => 189,  627 => 188,  623 => 187,  611 => 184,  604 => 183,  598 => 180,  594 => 179,  585 => 178,  583 => 177,  578 => 175,  574 => 174,  565 => 173,  563 => 172,  558 => 171,  548 => 169,  545 => 168,  544 => 167,  543 => 166,  526 => 165,  523 => 164,  522 => 163,  514 => 158,  510 => 157,  506 => 155,  498 => 152,  495 => 151,  493 => 150,  489 => 149,  486 => 148,  480 => 146,  478 => 145,  469 => 143,  462 => 142,  454 => 140,  452 => 139,  445 => 134,  440 => 132,  420 => 129,  414 => 128,  394 => 125,  388 => 124,  384 => 122,  372 => 120,  360 => 118,  358 => 117,  356 => 116,  352 => 114,  346 => 112,  338 => 110,  336 => 109,  317 => 107,  316 => 106,  312 => 105,  307 => 102,  301 => 99,  298 => 98,  296 => 97,  292 => 96,  284 => 92,  282 => 91,  279 => 90,  278 => 89,  272 => 85,  271 => 84,  267 => 82,  255 => 81,  251 => 79,  248 => 78,  246 => 77,  236 => 75,  228 => 73,  225 => 72,  223 => 71,  221 => 70,  217 => 68,  216 => 67,  207 => 60,  204 => 59,  193 => 58,  191 => 57,  185 => 53,  179 => 51,  176 => 50,  163 => 49,  160 => 48,  152 => 47,  148 => 46,  141 => 41,  133 => 36,  125 => 33,  120 => 31,  114 => 28,  111 => 27,  109 => 26,  104 => 23,  100 => 21,  92 => 19,  89 => 18,  81 => 17,  79 => 16,  75 => 14,  73 => 13,  70 => 12,  57 => 9,  54 => 8,  52 => 7,  49 => 6,  43 => 5,  34 => 3,  31 => 2,  19 => 1,);
    }
}
