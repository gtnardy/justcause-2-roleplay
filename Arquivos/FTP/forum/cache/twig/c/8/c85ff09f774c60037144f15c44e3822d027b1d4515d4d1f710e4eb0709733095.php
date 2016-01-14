<?php

/* acp_upload_main.html */
class __TwigTemplate_c85ff09f774c60037144f15c44e3822d027b1d4515d4d1f710e4eb0709733095 extends Twig_Template
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
        if ((isset($context["UPLOAD_ERROR"]) ? $context["UPLOAD_ERROR"] : null)) {
            // line 2
            echo "<div class=\"errorbox\">";
            echo (isset($context["UPLOAD_ERROR"]) ? $context["UPLOAD_ERROR"] : null);
            echo "</div>
";
        }
        // line 4
        if ((isset($context["S_UPDATED_SELF"]) ? $context["S_UPDATED_SELF"] : null)) {
            // line 5
            echo "<fieldset class=\"ext_self_updated_notice\">
\t<h1><i class=\"fa fa-check\" id=\"uploaded_ok\"></i>";
            // line 6
            echo (isset($context["S_UPDATED_SELF"]) ? $context["S_UPDATED_SELF"] : null);
            echo " - ";
            echo $this->env->getExtension('phpbb')->lang("EXT_UPDATED_LATEST_VERSION");
            echo "</h1>
</fieldset>
";
        }
        // line 9
        echo "<div class=\"upload-main-content\">
\t<form action=\"";
        // line 10
        echo (isset($context["U_UPLOAD"]) ? $context["U_UPLOAD"] : null);
        echo "\" method=\"post\" id=\"ext_upload\" autocomplete=\"off\" ";
        echo (isset($context["S_FORM_ENCTYPE"]) ? $context["S_FORM_ENCTYPE"] : null);
        echo ">
\t\t<div class=\"ext_upload_wrapper\">
\t\t\t<fieldset>
\t\t\t\t<div id=\"ext_upload_content\">
\t\t\t\t\t<span class=\"ext_upload_form_name\"><i class=\"fa fa-upload fa-lg\"></i> ";
        // line 14
        echo $this->env->getExtension('phpbb')->lang("EXTENSION_UPLOAD");
        echo "</span>
\t\t\t\t\t<p class=\"ext_upload_form_explain\">";
        // line 15
        echo $this->env->getExtension('phpbb')->lang("EXTENSION_UPLOAD_EXPLAIN");
        echo "</p>
\t\t\t\t\t<input type=\"text\" id=\"remote_upload\" name=\"remote_upload\" />
\t\t\t\t\t<input type=\"button\" id=\"button_upload\" style=\"display:none;\" value=\"";
        // line 17
        echo $this->env->getExtension('phpbb')->lang("BROWSE");
        echo "\" onclick=\"browseFile();\" />
\t\t\t\t\t<input type=\"file\" id=\"extupload\" name=\"extupload\" accept=\".zip\" onchange=\"setFileName();\" />
\t\t\t\t\t";
        // line 19
        echo (isset($context["S_FORM_TOKEN"]) ? $context["S_FORM_TOKEN"] : null);
        echo "
\t\t\t\t\t";
        // line 20
        echo (isset($context["S_HIDDEN_FIELDS"]) ? $context["S_HIDDEN_FIELDS"] : null);
        echo "
\t\t\t\t\t<span id=\"br_form_upload\"></span>
\t\t\t\t\t<label for=\"ext_checksum\">";
        // line 22
        echo $this->env->getExtension('phpbb')->lang("CHECKSUM");
        echo $this->env->getExtension('phpbb')->lang("COLON");
        echo "</label>
\t\t\t\t\t<input type=\"radio\" name=\"ext_checksum_type\" id=\"ext_checksum_type_md5\" value=\"md5\" checked=\"checked\" />
\t\t\t\t\t<label for=\"ext_checksum_type_md5\">md5</label>
\t\t\t\t\t<input type=\"radio\" name=\"ext_checksum_type\" id=\"ext_checksum_type_sha1\" value=\"sha1\" />
\t\t\t\t\t<label for=\"ext_checksum_type_sha1\">sha1</label>
\t\t\t\t\t<input type=\"text\" id=\"ext_checksum\" name=\"ext_checksum\" />
\t\t\t\t\t<span class=\"upload_ext_save_zip\"><input type=\"checkbox\" name=\"keepext\" id=\"keepext\" title=\"";
        // line 28
        echo $this->env->getExtension('phpbb')->lang("EXT_UPLOAD_SAVE_ZIP");
        echo "\" /><label for=\"keepext\">";
        echo $this->env->getExtension('phpbb')->lang("EXT_UPLOAD_SAVE_ZIP");
        echo "</label></span>
\t\t\t\t\t<button class=\"upload_ext_upload_button\" type=\"submit\" name=\"submit\" value=\"";
        // line 29
        echo $this->env->getExtension('phpbb')->lang("UPLOAD");
        echo "\" id=\"submit\"><i class=\"fa fa-upload\"></i> ";
        echo $this->env->getExtension('phpbb')->lang("UPLOAD");
        echo "</button>
\t\t\t\t</div>
\t\t\t\t<i id=\"upload\" class=\"fa fa-spinner fa-3x fa-spin\"></i>
\t\t\t</fieldset>
\t\t\t";
        // line 33
        if ( !(isset($context["S_SHOW_VALID_PHPBB_EXTENSIONS"]) ? $context["S_SHOW_VALID_PHPBB_EXTENSIONS"] : null)) {
            // line 34
            echo "\t\t\t<a href=\"";
            echo (isset($context["U_ACTION"]) ? $context["U_ACTION"] : null);
            echo "&amp;action=list_from_cdb\" class=\"upload_main_page_link_block\" id=\"load_valid_phpbb_extensions\">
\t\t\t\t<i class=\"fa fa-cogs\"></i>";
            // line 35
            echo $this->env->getExtension('phpbb')->lang("SHOW_VALID_PHPBB_EXTENSIONS");
            echo "
\t\t\t</a>
\t\t\t";
        }
        // line 38
        echo "\t\t</div>
\t\t<div class=\"upload-menu\">
\t\t\t<a href=\"";
        // line 40
        echo (isset($context["U_ACTION"]) ? $context["U_ACTION"] : null);
        echo "&amp;action=list\" class=\"upload_main_link upload_load_list\"><i class=\"fa fa-gears\"></i><span>";
        echo $this->env->getExtension('phpbb')->lang("EXTENSIONS_ADMIN");
        echo "</span></a>
\t\t\t<a href=\"";
        // line 41
        echo (isset($context["U_ACTION"]) ? $context["U_ACTION"] : null);
        echo "&amp;action=zip_packages\" class=\"upload_main_link upload_load_zip\"><i class=\"fa fa-archive\"></i><span>";
        echo $this->env->getExtension('phpbb')->lang("ACP_UPLOAD_ZIP_TITLE");
        echo "</span></a>
\t\t\t<a href=\"";
        // line 42
        echo (isset($context["U_ACTION"]) ? $context["U_ACTION"] : null);
        echo "&amp;action=uninstalled\" class=\"upload_main_link upload_load_uninstalled\"><i class=\"fa fa-paint-brush\"></i><span>";
        echo $this->env->getExtension('phpbb')->lang("ACP_UPLOAD_UNINSTALLED_TITLE");
        echo "</span></a>
\t\t</div>
\t\t";
        // line 44
        if ((isset($context["S_SHOW_VALID_PHPBB_EXTENSIONS"]) ? $context["S_SHOW_VALID_PHPBB_EXTENSIONS"] : null)) {
            // line 45
            echo "\t\t<div id=\"valid_phpbb_extensions\">
\t\t\t<div id=\"valid_phpbb_extensions_title\"><i class=\"fa fa-cogs\"></i> ";
            // line 46
            echo $this->env->getExtension('phpbb')->lang("VALID_PHPBB_EXTENSIONS");
            echo "</div>
\t\t\t";
            // line 47
            $location = "acp_upload_cdb.html";
            $namespace = false;
            if (strpos($location, '@') === 0) {
                $namespace = substr($location, 1, strpos($location, '/') - 1);
                $previous_look_up_order = $this->env->getNamespaceLookUpOrder();
                $this->env->setNamespaceLookUpOrder(array($namespace, '__main__'));
            }
            $this->loadTemplate("acp_upload_cdb.html", "acp_upload_main.html", 47)->display($context);
            if ($namespace) {
                $this->env->setNamespaceLookUpOrder($previous_look_up_order);
            }
            // line 48
            echo "\t\t</div>
\t\t";
        }
        // line 50
        echo "\t</form>
</div>";
    }

    public function getTemplateName()
    {
        return "acp_upload_main.html";
    }

    public function isTraitable()
    {
        return false;
    }

    public function getDebugInfo()
    {
        return array (  161 => 50,  157 => 48,  145 => 47,  141 => 46,  138 => 45,  136 => 44,  129 => 42,  123 => 41,  117 => 40,  113 => 38,  107 => 35,  102 => 34,  100 => 33,  91 => 29,  85 => 28,  75 => 22,  70 => 20,  66 => 19,  61 => 17,  56 => 15,  52 => 14,  43 => 10,  40 => 9,  32 => 6,  29 => 5,  27 => 4,  21 => 2,  19 => 1,);
    }
}
