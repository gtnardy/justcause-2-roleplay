<?php

/* memberlist_view.html */
class __TwigTemplate_58b3c34463341392a173e3d3ba957280fe11603d9118c731cfdfd3265f1e417a extends Twig_Template
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
        $this->loadTemplate("overall_header.html", "memberlist_view.html", 1)->display($context);
        if ($namespace) {
            $this->env->setNamespaceLookUpOrder($previous_look_up_order);
        }
        // line 2
        echo " ";
        // line 3
        echo "<form method=\"post\" action=\"";
        echo (isset($context["S_PROFILE_ACTION"]) ? $context["S_PROFILE_ACTION"] : null);
        echo "\" id=\"viewprofile\">
 <div class=\"side-segment\"><h3>";
        // line 4
        echo (isset($context["PAGE_TITLE"]) ? $context["PAGE_TITLE"] : null);
        echo "</h3></div>

 <div class=\"row\">
        <div class=\"col-md-6\">
            <div class=\"panel panel-profile text-muted\">
                <div class=\"panel-heading text-center bg-profile\">
\t\t\t\t <div class=\"pull-left pos-abs l-25\">
\t\t\t\t\t";
        // line 11
        if ((isset($context["U_EDIT_SELF"]) ? $context["U_EDIT_SELF"] : null)) {
            echo "<a href=\"";
            echo (isset($context["U_EDIT_SELF"]) ? $context["U_EDIT_SELF"] : null);
            echo "\" title=\"";
            echo $this->env->getExtension('phpbb')->lang("EDIT_PROFILE");
            echo "\" class=\"btn btn-xs btn-primary\"><i class=\"fa fa-pencil\"></i></a>";
        }
        // line 12
        echo "\t\t\t\t </div>
\t\t\t\t <div class=\"pull-right pos-abs r-25\">
\t\t\t\t\t";
        // line 14
        if (((isset($context["U_ACP"]) ? $context["U_ACP"] : null) || (isset($context["U_USER_BAN"]) ? $context["U_USER_BAN"] : null))) {
            // line 15
            echo "\t\t\t\t\t<div class=\"btn-group\">
\t\t\t\t\t\t<div class=\"dropdown\">
\t\t\t\t\t\t  <a href=\"#\" data-toggle=\"dropdown\" class=\"btn btn-xs btn-primary\" title=\"";
            // line 17
            echo $this->env->getExtension('phpbb')->lang("USER_ADMIN");
            echo "\"><i class=\"fa fa-cog\"></i></a>
\t\t\t\t\t\t\t<ul class=\"dropdown-menu dropdown-menu-right\">
\t\t\t\t\t\t\t\t";
            // line 19
            if ((isset($context["U_USER_ADMIN"]) ? $context["U_USER_ADMIN"] : null)) {
                echo "<li><a href=\"";
                echo (isset($context["U_USER_ADMIN"]) ? $context["U_USER_ADMIN"] : null);
                echo "\">";
                echo $this->env->getExtension('phpbb')->lang("USER_ADMIN");
                echo "</a></li>";
            }
            // line 20
            echo "\t\t\t\t\t\t\t\t";
            if ((isset($context["U_USER_BAN"]) ? $context["U_USER_BAN"] : null)) {
                echo "<li><a href=\"";
                echo (isset($context["U_USER_BAN"]) ? $context["U_USER_BAN"] : null);
                echo "\">";
                echo $this->env->getExtension('phpbb')->lang("USER_BAN");
                echo "</a></li>";
            }
            // line 21
            echo "\t\t\t\t\t\t\t\t";
            if ((isset($context["U_SWITCH_PERMISSIONS"]) ? $context["U_SWITCH_PERMISSIONS"] : null)) {
                echo "<li><a href=\"";
                echo (isset($context["U_SWITCH_PERMISSIONS"]) ? $context["U_SWITCH_PERMISSIONS"] : null);
                echo "\">";
                echo $this->env->getExtension('phpbb')->lang("USE_PERMISSIONS");
                echo "</a></li>";
            }
            // line 22
            echo "\t\t\t\t\t\t\t\t";
            if ((isset($context["U_RESTORE_PERMISSIONS"]) ? $context["U_RESTORE_PERMISSIONS"] : null)) {
                echo "<li><a href=\"";
                echo (isset($context["U_RESTORE_PERMISSIONS"]) ? $context["U_RESTORE_PERMISSIONS"] : null);
                echo "\">";
                echo $this->env->getExtension('phpbb')->lang("RESTORE_PERMISSIONS");
                echo "</a></li>";
            }
            // line 23
            echo "\t\t\t\t\t\t\t</ul>
\t\t\t\t\t\t</div>
\t\t\t\t\t</div>
\t\t\t\t\t";
        }
        // line 27
        echo "\t\t\t\t </div>
\t\t\t\t 
\t\t\t\t <div class=\"profile-avatar\">
\t\t\t\t  ";
        // line 30
        if ((isset($context["AVATAR_IMG"]) ? $context["AVATAR_IMG"] : null)) {
            echo (isset($context["AVATAR_IMG"]) ? $context["AVATAR_IMG"] : null);
        }
        // line 31
        echo "\t\t\t\t  ";
        if ( !(isset($context["AVATAR_IMG"]) ? $context["AVATAR_IMG"] : null)) {
            // line 32
            echo "\t\t\t\t   <img src=\"";
            echo (isset($context["T_THEME_PATH"]) ? $context["T_THEME_PATH"] : null);
            echo "/images/no_avatar.gif\" alt=\"\" />
\t\t\t      ";
        }
        // line 34
        echo "\t\t\t\t </div>

                    <h4>";
        // line 36
        if ((isset($context["USER_COLOR"]) ? $context["USER_COLOR"] : null)) {
            echo "<span style=\"color:";
            echo (isset($context["USER_COLOR"]) ? $context["USER_COLOR"] : null);
            echo ";font-weight:bold;\">";
        } else {
        }
        echo (isset($context["USERNAME"]) ? $context["USERNAME"] : null);
        echo "</h4>
                   
\t\t\t\t   ";
        // line 38
        // line 39
        echo "\t\t\t\t\t";
        if ((isset($context["RANK_TITLE"]) ? $context["RANK_TITLE"] : null)) {
            echo "<p>";
            echo (isset($context["RANK_TITLE"]) ? $context["RANK_TITLE"] : null);
            echo "</p>";
        }
        // line 40
        echo "\t\t\t\t   ";
        // line 41
        echo "\t\t\t\t   
\t\t\t\t   ";
        // line 42
        echo " \t
                    ";
        // line 43
        if ((isset($context["RANK_IMG"]) ? $context["RANK_IMG"] : null)) {
            echo "<p>";
            echo (isset($context["RANK_IMG"]) ? $context["RANK_IMG"] : null);
            echo "</p>";
        }
        // line 44
        echo "\t\t\t\t   ";
        echo "\t
\t\t\t\t\t  
\t\t\t\t\t  <!-- <small>@SiteSplat</small> -->
                </div>
\t\t\t\t";
        // line 48
        if ((isset($context["INTERESTS"]) ? $context["INTERESTS"] : null)) {
            // line 49
            echo "\t\t\t\t<div class=\"panel-body\"> 
                <div class=\"text-center\"> 
\t\t\t\t    <h5>";
            // line 51
            echo $this->env->getExtension('phpbb')->lang("INTERESTS");
            echo "</h5>
                    <p>";
            // line 52
            echo (isset($context["INTERESTS"]) ? $context["INTERESTS"] : null);
            echo "</p>
                </div>
\t\t\t\t</div>
\t\t\t\t";
        }
        // line 56
        echo "\t\t\t\t<div class=\"panel-footer\">
\t\t\t\t";
        // line 57
        if (((isset($context["S_USER_LOGGED_IN"]) ? $context["S_USER_LOGGED_IN"] : null) && (isset($context["S_ZEBRA"]) ? $context["S_ZEBRA"] : null))) {
            // line 58
            echo "                <div class=\"btn-group btn-group-justified\" role=\"group\">
\t\t\t\t";
            // line 59
            if ((isset($context["U_REMOVE_FRIEND"]) ? $context["U_REMOVE_FRIEND"] : null)) {
                // line 60
                echo "\t\t\t\t<div class=\"btn-group\" role=\"group\">
\t\t\t\t\t<a class=\"btn btn-default zebra\" title=\"\" href=\"";
                // line 61
                echo (isset($context["U_REMOVE_FRIEND"]) ? $context["U_REMOVE_FRIEND"] : null);
                echo "\" data-ajax=\"zebra\"><i class=\"icon-moon-heart-broken\"></i>&nbsp;";
                echo $this->env->getExtension('phpbb')->lang("REMOVE_FRIEND");
                echo "</a>
\t\t\t\t</div>
\t\t\t\t";
            } elseif (            // line 63
(isset($context["U_REMOVE_FOE"]) ? $context["U_REMOVE_FOE"] : null)) {
                // line 64
                echo "\t\t\t\t<div class=\"btn-group\" role=\"group\">
\t\t\t\t\t<a class=\"btn btn-default zebra\" title=\"\" href=\"";
                // line 65
                echo (isset($context["U_REMOVE_FOE"]) ? $context["U_REMOVE_FOE"] : null);
                echo "\" data-ajax=\"zebra\"><i class=\"fa fa-times\"></i>&nbsp;<i class=\"fa fa-bug\"></i>&nbsp;";
                echo $this->env->getExtension('phpbb')->lang("REMOVE_FOE");
                echo "</a>
\t\t\t\t</div>
\t\t\t\t";
            } else {
                // line 68
                echo "\t\t\t\t";
                if ((isset($context["U_ADD_FRIEND"]) ? $context["U_ADD_FRIEND"] : null)) {
                    // line 69
                    echo "\t\t\t\t    <div class=\"btn-group\" role=\"group\">
\t\t\t\t    <a class=\"btn btn-default zebra\" title=\"\" href=\"";
                    // line 70
                    echo (isset($context["U_ADD_FRIEND"]) ? $context["U_ADD_FRIEND"] : null);
                    echo "\" data-ajax=\"zebra\"><i class=\"fa fa-heart\"></i>&nbsp;";
                    echo $this->env->getExtension('phpbb')->lang("ADD_FRIEND");
                    echo "</a>
\t\t\t\t\t</div>
\t\t\t\t\t";
                }
                // line 73
                echo "\t\t\t\t\t";
                if ((isset($context["U_ADD_FOE"]) ? $context["U_ADD_FOE"] : null)) {
                    // line 74
                    echo "\t\t\t\t\t<div class=\"btn-group\" role=\"group\">
\t\t\t\t\t<a class=\"btn btn-default zebra\" title=\"\" href=\"";
                    // line 75
                    echo (isset($context["U_ADD_FOE"]) ? $context["U_ADD_FOE"] : null);
                    echo "\" data-ajax=\"zebra\"><i class=\"fa fa-bug\"></i>&nbsp;";
                    echo $this->env->getExtension('phpbb')->lang("ADD_FOE");
                    echo "</a>
\t\t\t\t    </div>
\t\t\t\t";
                }
                // line 77
                echo "\t
\t\t\t    ";
            }
            // line 79
            echo "\t\t\t\t</div>\t\t\t\t\t
\t\t        ";
        }
        // line 80
        echo " 
\t\t\t\t</div>
            </div>
    \t</div>
\t
\t    <div class=\"col-md-6\">
            <div class=\"panel panel-default\">
                <div class=\"panel-heading\"><strong><span class=\"glyphicon glyphicon-th\"></span>&nbsp;";
        // line 87
        echo $this->env->getExtension('phpbb')->lang("BIO");
        if ((isset($context["S_USER_INACTIVE"]) ? $context["S_USER_INACTIVE"] : null)) {
            echo "<span class=\"label label-default\">";
            echo $this->env->getExtension('phpbb')->lang("USER_IS_INACTIVE");
            echo $this->env->getExtension('phpbb')->lang("COLON");
            echo "&nbsp;";
            echo (isset($context["USER_INACTIVE_REASON"]) ? $context["USER_INACTIVE_REASON"] : null);
            echo "</span>";
        }
        echo "</strong></div>
                <div class=\"panel-body\">
                    <ul class=\"list-unstyled list-info text-muted\">
\t\t\t\t\t";
        // line 90
        // line 91
        echo "                        <li>
                            <span class=\"icon glyphicon glyphicon-user\"></span>
                            <label>";
        // line 93
        echo $this->env->getExtension('phpbb')->lang("USERNAME");
        echo "</label>
                            ";
        // line 94
        if ((isset($context["USER_COLOR"]) ? $context["USER_COLOR"] : null)) {
            echo "<span style=\"color:";
            echo (isset($context["USER_COLOR"]) ? $context["USER_COLOR"] : null);
            echo ";font-weight:bold;\">";
        } else {
        }
        echo (isset($context["USERNAME"]) ? $context["USERNAME"] : null);
        echo "</span>
                        </li>
\t\t\t\t\t    <li>
                            <span class=\"icon glyphicon glyphicon-globe\"></span>
                            <label>";
        // line 98
        echo $this->env->getExtension('phpbb')->lang("USER_STATUS");
        echo "</label>
                            ";
        // line 99
        if ((isset($context["S_ONLINE"]) ? $context["S_ONLINE"] : null)) {
            echo $this->env->getExtension('phpbb')->lang("ONLINE");
        } else {
            echo $this->env->getExtension('phpbb')->lang("OFF_LINE");
        }
        // line 100
        echo "                        </li>
                        <li>
                        <span class=\"icon glyphicon glyphicon-home\"></span>
                           <label>";
        // line 103
        echo $this->env->getExtension('phpbb')->lang("AGE");
        echo "</label>
                           ";
        // line 104
        if (((isset($context["AGE"]) ? $context["AGE"] : null) !== "")) {
            echo (isset($context["AGE"]) ? $context["AGE"] : null);
        } else {
        }
        // line 105
        echo "                        </li>
                        ";
        // line 106
        $context['_parent'] = (array) $context;
        $context['_seq'] = twig_ensure_traversable($this->getAttribute((isset($context["loops"]) ? $context["loops"] : null), "custom_fields", array()));
        foreach ($context['_seq'] as $context["_key"] => $context["custom_fields"]) {
            // line 107
            echo "\t\t\t\t\t\t";
            if ( !$this->getAttribute($context["custom_fields"], "S_PROFILE_CONTACT", array())) {
                // line 108
                echo "\t\t\t\t        <li>
                           <span class=\"icon glyphicon glyphicon-cog\"></span>
                           <label>";
                // line 110
                echo $this->getAttribute($context["custom_fields"], "PROFILE_FIELD_NAME", array());
                echo "</label>
                            ";
                // line 111
                echo $this->getAttribute($context["custom_fields"], "PROFILE_FIELD_VALUE", array());
                echo "
                        </li>
\t\t\t\t\t\t";
            }
            // line 114
            echo "\t\t\t\t\t\t";
        }
        $_parent = $context['_parent'];
        unset($context['_seq'], $context['_iterated'], $context['_key'], $context['custom_fields'], $context['_parent'], $context['loop']);
        $context = array_intersect_key($context, $_parent) + $_parent;
        echo "\t
\t\t\t\t\t";
        // line 115
        // line 116
        echo "                    </ul>
\t\t\t\t  <div class=\"space10\"></div>
                </div>
\t\t\t\t<div class=\"panel-footer\">
\t\t\t\t    <div class=\"clearfix mini-profile-contact-wrapper\">
\t\t\t\t\t\t<ul class=\"mini-profile-contact pull-right\">
\t\t\t\t\t\t    ";
        // line 122
        if ((isset($context["U_PM"]) ? $context["U_PM"] : null)) {
            echo "<li><a class=\"default-contact\" href=\"";
            echo (isset($context["U_PM"]) ? $context["U_PM"] : null);
            echo "\" title=\"";
            echo $this->env->getExtension('phpbb')->lang("SEND_PRIVATE_MESSAGE");
            echo "\"><i class=\"icon-moon-pm\"></i></a></li>";
        }
        // line 123
        echo "\t\t\t\t\t\t\t";
        if ((isset($context["U_EMAIL"]) ? $context["U_EMAIL"] : null)) {
            echo "<li><a class=\"default-contact\" href=\"";
            echo (isset($context["U_EMAIL"]) ? $context["U_EMAIL"] : null);
            echo "\" title=\"";
            echo $this->env->getExtension('phpbb')->lang("SEND_EMAIL_USER");
            echo "\"><i class=\"icon-moon-email\"></i></a></li>";
        }
        // line 124
        echo "\t\t\t\t\t\t\t";
        if (((isset($context["U_JABBER"]) ? $context["U_JABBER"] : null) && (isset($context["S_JABBER_ENABLED"]) ? $context["S_JABBER_ENABLED"] : null))) {
            echo "<li><a class=\"default-contact\" href=\"";
            echo (isset($context["U_JABBER"]) ? $context["U_JABBER"] : null);
            echo "\" onclick=\"popup(this.href, 550, 320); return false;\" title=\"";
            echo $this->env->getExtension('phpbb')->lang("SEND_JABBER_MESSAGE");
            echo "\"><i class=\"fa fa-comment\"></i></a></li>";
        }
        // line 125
        echo "\t\t\t                ";
        $context['_parent'] = (array) $context;
        $context['_seq'] = twig_ensure_traversable($this->getAttribute((isset($context["loops"]) ? $context["loops"] : null), "custom_fields", array()));
        foreach ($context['_seq'] as $context["_key"] => $context["custom_fields"]) {
            // line 126
            echo "\t\t\t\t\t\t\t";
            if ($this->getAttribute($context["custom_fields"], "S_PROFILE_CONTACT", array())) {
                // line 127
                echo "\t\t\t\t\t\t\t\t";
                if ($this->getAttribute($context["custom_fields"], "PROFILE_FIELD_CONTACT", array())) {
                    // line 128
                    echo "\t\t\t\t\t\t\t\t\t<li><a class=\"default-contact\" href=\"";
                    echo $this->getAttribute($context["custom_fields"], "PROFILE_FIELD_CONTACT", array());
                    echo "\" title=\"";
                    echo $this->getAttribute($context["custom_fields"], "PROFILE_FIELD_DESC", array());
                    echo "\"><i class=\"icon-moon-";
                    echo $this->getAttribute($context["custom_fields"], "PROFILE_FIELD_NAME", array());
                    echo "\"></i></a></li>
\t\t\t\t\t\t\t\t";
                }
                // line 130
                echo "\t\t\t\t\t\t\t";
            }
            // line 131
            echo "\t\t\t\t\t\t    ";
        }
        $_parent = $context['_parent'];
        unset($context['_seq'], $context['_iterated'], $context['_key'], $context['custom_fields'], $context['_parent'], $context['loop']);
        $context = array_intersect_key($context, $_parent) + $_parent;
        // line 132
        echo "\t\t\t\t\t\t</ul>
\t\t\t\t\t</div>
\t\t\t    </div>
            </div>
        </div>
\t
 </div>
 
<div class=\"clearfix\">
";
        // line 141
        // line 142
        echo "<div class=\"side-segment\"><h3>";
        echo $this->env->getExtension('phpbb')->lang("USER_FORUM");
        echo "</h3></div>

    <section class=\"ui-timeline text-muted\">
            <article class=\"tl-item\">
                <div class=\"tl-body\">
                    <div class=\"tl-entry\">
                        <div class=\"tl-caption\">
                            <a class=\"btn btn-primary btn-block\" href=\"#\">";
        // line 149
        echo $this->env->getExtension('phpbb')->lang("JOINED");
        echo "</a>
                        </div>
                    </div>
                </div>
            </article>

            <article class=\"tl-item\">
                <div class=\"tl-body\">
                    <div class=\"tl-entry\">
                        <div class=\"tl-time\">";
        // line 158
        echo (isset($context["JOINED"]) ? $context["JOINED"] : null);
        echo "</div>
                        <div class=\"tl-icon square-icon sm bg-info\"><i class=\"fa fa-automobile\"></i></div>
                        <div class=\"tl-content\">
                            <h4 class=\"tl-tile text-primary\">";
        // line 161
        echo (isset($context["USERNAME"]) ? $context["USERNAME"] : null);
        echo "&nbsp;";
        echo $this->env->getExtension('phpbb')->lang("MEMBERLIST_P_JOINED");
        echo "</h4>
                            <p>";
        // line 162
        echo $this->env->getExtension('phpbb')->lang("MEMBERLIST_P_EXPL");
        echo "</p>
                        </div>
                    </div>
                </div>
            </article>

            <article class=\"tl-item alt\">
                <div class=\"tl-body\">
                    <div class=\"tl-entry\">
                        <div class=\"tl-time\">";
        // line 171
        echo (isset($context["LAST_ACTIVE"]) ? $context["LAST_ACTIVE"] : null);
        echo "</div>
                        <div class=\"tl-icon square-icon sm bg-warning\"><i class=\"fa fa-eye\"></i></div>
                        <div class=\"tl-content\">
                            <h4 class=\"tl-tile text-danger\">";
        // line 174
        echo $this->env->getExtension('phpbb')->lang("LAST_ACTIVE");
        echo "</h4>
                            <p>";
        // line 175
        echo $this->env->getExtension('phpbb')->lang("MEMBERLIST_P_DATE_EXPL");
        echo "</p>
                        </div>
                    </div>
                </div>
            </article>

\t\t\t
\t\t\t<article class=\"tl-item\">
                <div class=\"tl-body\">
                    <div class=\"tl-entry\">
                        <div class=\"tl-time\">3 hours ago</div>
                        <div class=\"tl-icon square-icon sm bg-success\"><i class=\"fa fa-comments\"></i></div>
                        <div class=\"tl-content\">
                            <h4 class=\"tl-tile text-warning\">";
        // line 188
        echo $this->env->getExtension('phpbb')->lang("TOTAL_POSTS");
        echo "</h4>
                            <p>
\t\t\t\t\t\t\t";
        // line 190
        echo (isset($context["POSTS"]) ? $context["POSTS"] : null);
        echo "&nbsp;
\t\t\t\t\t\t\t";
        // line 191
        if ((isset($context["S_DISPLAY_SEARCH"]) ? $context["S_DISPLAY_SEARCH"] : null)) {
            echo "&#45;<strong><a href=\"";
            echo (isset($context["U_SEARCH_USER"]) ? $context["U_SEARCH_USER"] : null);
            echo "\">&nbsp;";
            echo $this->env->getExtension('phpbb')->lang("SEARCH_USER_POSTS");
            echo "</a></strong>";
        }
        // line 192
        echo "\t\t\t\t\t\t\t";
        if ((isset($context["POSTS_PCT"]) ? $context["POSTS_PCT"] : null)) {
            echo "&#40;";
            echo (isset($context["POSTS_PCT"]) ? $context["POSTS_PCT"] : null);
            echo "&nbsp;&#47;&nbsp;";
            echo (isset($context["POSTS_DAY"]) ? $context["POSTS_DAY"] : null);
            echo "&#41;";
        }
        // line 193
        echo "\t\t\t\t\t\t\t";
        if (((isset($context["POSTS_IN_QUEUE"]) ? $context["POSTS_IN_QUEUE"] : null) && (isset($context["U_MCP_QUEUE"]) ? $context["U_MCP_QUEUE"] : null))) {
            echo "&#40;<a href=\"";
            echo (isset($context["U_MCP_QUEUE"]) ? $context["U_MCP_QUEUE"] : null);
            echo "\">";
            echo $this->env->getExtension('phpbb')->lang("POSTS_IN_QUEUE");
            echo "</a>&#41;";
        } elseif ((isset($context["POSTS_IN_QUEUE"]) ? $context["POSTS_IN_QUEUE"] : null)) {
            echo "&#40;";
            echo $this->env->getExtension('phpbb')->lang("POSTS_IN_QUEUE");
            echo "&#41;";
        }
        // line 194
        echo "\t\t\t\t\t\t\t</p>
                        </div>
                    </div>
                </div>
            </article>
\t\t\t
\t\t\t";
        // line 200
        if (((isset($context["S_SHOW_ACTIVITY"]) ? $context["S_SHOW_ACTIVITY"] : null) && (isset($context["POSTS"]) ? $context["POSTS"] : null))) {
            // line 201
            echo "\t\t\t<article class=\"tl-item alt\">
                <div class=\"tl-body\">
                    <div class=\"tl-entry\">
                        <div class=\"tl-time\">7 hours ago</div>
                        <div class=\"tl-icon square-icon sm bg-primary\"><i class=\"fa fa-check\"></i></div>
                        <div class=\"tl-content\">
                            <h4 class=\"tl-tile text-success\">";
            // line 207
            echo $this->env->getExtension('phpbb')->lang("ACTIVE_IN_FORUM");
            echo "</h4>
                            <p>";
            // line 208
            if (((isset($context["ACTIVE_FORUM"]) ? $context["ACTIVE_FORUM"] : null) != "")) {
                echo "<a href=\"";
                echo (isset($context["U_ACTIVE_FORUM"]) ? $context["U_ACTIVE_FORUM"] : null);
                echo "\">";
                echo (isset($context["ACTIVE_FORUM"]) ? $context["ACTIVE_FORUM"] : null);
                echo "</a>&nbsp;&#40;";
                echo (isset($context["ACTIVE_FORUM_POSTS"]) ? $context["ACTIVE_FORUM_POSTS"] : null);
                echo "&nbsp;&#47;&nbsp;";
                echo (isset($context["ACTIVE_FORUM_PCT"]) ? $context["ACTIVE_FORUM_PCT"] : null);
                echo "&#41;";
            } else {
                echo "&nbsp;&#45;&nbsp;";
            }
            echo "</p>
                        </div>
                    </div>
                </div>
            </article>
\t\t\t
\t\t\t
\t\t\t<article class=\"tl-item\">
                <div class=\"tl-body\">
                    <div class=\"tl-entry\">
                        <div class=\"tl-time\">3 hours ago</div>
                        <div class=\"tl-icon square-icon sm bg-info\"><i class=\"fa fa-fire\"></i></div>
                        <div class=\"tl-content\">
                            <h4 class=\"tl-tile text-warning\">";
            // line 221
            echo $this->env->getExtension('phpbb')->lang("ACTIVE_IN_TOPIC");
            echo "</h4>
                            <p>";
            // line 222
            if (((isset($context["ACTIVE_TOPIC"]) ? $context["ACTIVE_TOPIC"] : null) != "")) {
                echo "<a href=\"";
                echo (isset($context["U_ACTIVE_TOPIC"]) ? $context["U_ACTIVE_TOPIC"] : null);
                echo "\">";
                echo (isset($context["ACTIVE_TOPIC"]) ? $context["ACTIVE_TOPIC"] : null);
                echo "</a>&nbsp;&#40;";
                echo (isset($context["ACTIVE_TOPIC_POSTS"]) ? $context["ACTIVE_TOPIC_POSTS"] : null);
                echo "&nbsp;&#47;&nbsp;";
                echo (isset($context["ACTIVE_TOPIC_PCT"]) ? $context["ACTIVE_TOPIC_PCT"] : null);
                echo "&#41;";
            } else {
                echo "&nbsp;&#45;&nbsp;";
            }
            echo "</p>
                        </div>
                    </div>
                </div>
            </article>
\t\t\t";
        }
        // line 228
        echo "\t\t\t
\t\t   ";
        // line 229
        if ((isset($context["S_WARNINGS"]) ? $context["S_WARNINGS"] : null)) {
            // line 230
            echo "            <article class=\"tl-item alt\">
                <div class=\"tl-body\">
                    <div class=\"tl-entry\">
                        <div class=\"tl-time\">3 hours ago</div>
                        <div class=\"tl-icon square-icon sm bg-success\"><i class=\"fa fa-bomb\"></i></div>
                        <div class=\"tl-content\">
                            <h4 class=\"tl-tile text-warning\">";
            // line 236
            echo $this->env->getExtension('phpbb')->lang("WARNINGS");
            echo "</h4>
                            <p>";
            // line 237
            echo (isset($context["WARNINGS"]) ? $context["WARNINGS"] : null);
            echo "&nbsp;";
            if (((isset($context["U_NOTES"]) ? $context["U_NOTES"] : null) || (isset($context["U_WARN"]) ? $context["U_WARN"] : null))) {
                echo "&#91;";
                if ((isset($context["U_NOTES"]) ? $context["U_NOTES"] : null)) {
                    echo "<a href=\"";
                    echo (isset($context["U_NOTES"]) ? $context["U_NOTES"] : null);
                    echo "\">";
                    echo $this->env->getExtension('phpbb')->lang("VIEW_NOTES");
                    echo "</a>";
                }
                if ((isset($context["U_WARN"]) ? $context["U_WARN"] : null)) {
                    if ((isset($context["U_NOTES"]) ? $context["U_NOTES"] : null)) {
                        echo "&nbsp;&#124;&nbsp;";
                    }
                    echo "<a href=\"";
                    echo (isset($context["U_WARN"]) ? $context["U_WARN"] : null);
                    echo "\">";
                    echo $this->env->getExtension('phpbb')->lang("WARN_USER");
                    echo "</a>";
                }
                echo "&#93;";
            }
            echo "</p>
                        </div>
                    </div>
                </div>
            </article>
            ";
        }
        // line 243
        echo "
\t\t\t<article class=\"tl-item\">
                <div class=\"tl-body\">
                    <div class=\"tl-entry\">
                        <div class=\"tl-caption\">
                            <a class=\"btn btn-danger btn-block\" href=\"javascript:;\">";
        // line 248
        echo $this->env->getExtension('phpbb')->lang("END_TIMELINE");
        echo "</a>
                        </div>
                    </div>
                </div>
            </article>

\t\t<!-- Last articles
\t\t    <article class=\"tl-item\">
                <div class=\"tl-body\">
                    <div class=\"tl-entry\">
                        <div class=\"tl-time\">10 hours ago</div>
                        <div class=\"tl-icon square-icon sm bg-primary\"><i class=\"fa fa-clock-o\"></i></div>
                        <div class=\"tl-content\">
                            <h4 class=\"tl-tile text-info\">Accusantium sint</h4>
                            <p>Ipsam, minus, quam, sit officiis accusantium sint voluptates voluptatibus minima cum non quos corrupti dolorem eligendi modi eius magnam unde!</p>
                        </div>
                    </div>
                </div>
            </article>
\t\t
            <article class=\"tl-item alt\">
                <div class=\"tl-body\">
                    <div class=\"tl-entry\">
                        <div class=\"tl-time\">9:10 AM</div>
                        <div class=\"tl-icon square-icon sm bg-info\"><i class=\"fa fa-gift\"></i></div>
                        <div class=\"tl-content\">
                            <h4 class=\"tl-tile text-primary\">Sed cumque temporibus</h4>
                            <p>Deserunt sed cumque temporibus. Doloribus, iste, sit recusandae fugiat assumenda ea magni at doloremque ipsum amet molestias error mollitia maxime ad alias eos id cumque corporis placeat nisi a quaerat nemo magnam ab numquam ratione facere dolorum. Cumque, dolores, sint molestiae eaque quibusdam illo error!</p>
                        </div>
                    </div>
                </div>
            </article>\t
        Last articles -->
    </section>
";
        // line 282
        echo "\t
</div>
</form>

";
        // line 286
        // line 287
        echo "
";
        // line 288
        if ((isset($context["SIGNATURE"]) ? $context["SIGNATURE"] : null)) {
            // line 289
            echo "   <div class=\"clearfix\">
    <div class=\"side-segment\"><h3>";
            // line 290
            echo $this->env->getExtension('phpbb')->lang("SIGNATURE");
            echo "</h3></div>
     <div class=\"panel\">
\t <div class=\"panel-body\">
      <div class=\"signature\" style=\"border-top:none; margin-top: 0;\">";
            // line 293
            echo (isset($context["SIGNATURE"]) ? $context["SIGNATURE"] : null);
            echo "</div>
    </div>
\t</div>
   </div>
";
        }
        // line 298
        echo "

 ";
        // line 300
        // line 301
        echo "<div class=\"row\">
<div class=\"col-md-4 col-md-offset-4\">
";
        // line 303
        $location = "jumpbox_options.html";
        $namespace = false;
        if (strpos($location, '@') === 0) {
            $namespace = substr($location, 1, strpos($location, '/') - 1);
            $previous_look_up_order = $this->env->getNamespaceLookUpOrder();
            $this->env->setNamespaceLookUpOrder(array($namespace, '__main__'));
        }
        $this->loadTemplate("jumpbox_options.html", "memberlist_view.html", 303)->display($context);
        if ($namespace) {
            $this->env->setNamespaceLookUpOrder($previous_look_up_order);
        }
        // line 304
        echo "</div>
<div class=\"space10\"></div>
 <div class=\"space10\"></div>
</div>

";
        // line 309
        $location = "jump_links.html";
        $namespace = false;
        if (strpos($location, '@') === 0) {
            $namespace = substr($location, 1, strpos($location, '/') - 1);
            $previous_look_up_order = $this->env->getNamespaceLookUpOrder();
            $this->env->setNamespaceLookUpOrder(array($namespace, '__main__'));
        }
        $this->loadTemplate("jump_links.html", "memberlist_view.html", 309)->display($context);
        if ($namespace) {
            $this->env->setNamespaceLookUpOrder($previous_look_up_order);
        }
        // line 310
        $location = "overall_footer.html";
        $namespace = false;
        if (strpos($location, '@') === 0) {
            $namespace = substr($location, 1, strpos($location, '/') - 1);
            $previous_look_up_order = $this->env->getNamespaceLookUpOrder();
            $this->env->setNamespaceLookUpOrder(array($namespace, '__main__'));
        }
        $this->loadTemplate("overall_footer.html", "memberlist_view.html", 310)->display($context);
        if ($namespace) {
            $this->env->setNamespaceLookUpOrder($previous_look_up_order);
        }
    }

    public function getTemplateName()
    {
        return "memberlist_view.html";
    }

    public function isTraitable()
    {
        return false;
    }

    public function getDebugInfo()
    {
        return array (  786 => 310,  774 => 309,  767 => 304,  755 => 303,  751 => 301,  750 => 300,  746 => 298,  738 => 293,  732 => 290,  729 => 289,  727 => 288,  724 => 287,  723 => 286,  717 => 282,  680 => 248,  673 => 243,  642 => 237,  638 => 236,  630 => 230,  628 => 229,  625 => 228,  604 => 222,  600 => 221,  572 => 208,  568 => 207,  560 => 201,  558 => 200,  550 => 194,  537 => 193,  528 => 192,  520 => 191,  516 => 190,  511 => 188,  495 => 175,  491 => 174,  485 => 171,  473 => 162,  467 => 161,  461 => 158,  449 => 149,  438 => 142,  437 => 141,  426 => 132,  420 => 131,  417 => 130,  407 => 128,  404 => 127,  401 => 126,  396 => 125,  387 => 124,  378 => 123,  370 => 122,  362 => 116,  361 => 115,  353 => 114,  347 => 111,  343 => 110,  339 => 108,  336 => 107,  332 => 106,  329 => 105,  324 => 104,  320 => 103,  315 => 100,  309 => 99,  305 => 98,  292 => 94,  288 => 93,  284 => 91,  283 => 90,  269 => 87,  260 => 80,  256 => 79,  252 => 77,  244 => 75,  241 => 74,  238 => 73,  230 => 70,  227 => 69,  224 => 68,  216 => 65,  213 => 64,  211 => 63,  204 => 61,  201 => 60,  199 => 59,  196 => 58,  194 => 57,  191 => 56,  184 => 52,  180 => 51,  176 => 49,  174 => 48,  167 => 44,  161 => 43,  158 => 42,  155 => 41,  153 => 40,  146 => 39,  145 => 38,  134 => 36,  130 => 34,  124 => 32,  121 => 31,  117 => 30,  112 => 27,  106 => 23,  97 => 22,  88 => 21,  79 => 20,  71 => 19,  66 => 17,  62 => 15,  60 => 14,  56 => 12,  48 => 11,  38 => 4,  33 => 3,  31 => 2,  19 => 1,);
    }
}
