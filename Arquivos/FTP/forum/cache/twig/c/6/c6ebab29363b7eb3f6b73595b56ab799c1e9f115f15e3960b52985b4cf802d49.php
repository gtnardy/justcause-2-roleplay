<?php

/* ucp_avatar_options_upload.html */
class __TwigTemplate_c6ebab29363b7eb3f6b73595b56ab799c1e9f115f15e3960b52985b4cf802d49 extends Twig_Template
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
        echo "<style>
.btn-file{position:relative;overflow:hidden;vertical-align:middle}.btn-file>input{position:absolute;top:0;right:0;width:100%;height:100%;margin:0;font-size:23px;cursor:pointer;filter:alpha(opacity=0);opacity:0;direction:ltr}.fileinput{display:inline-block;margin-bottom:9px}.fileinput .form-control{display:inline-block;padding-top:7px;padding-bottom:5px;margin-bottom:0;vertical-align:middle;cursor:text}.fileinput .thumbnail{display:inline-block;margin-bottom:5px;overflow:hidden;text-align:center;vertical-align:middle}.fileinput .thumbnail>img{max-height:100%}.fileinput .btn{vertical-align:middle}.fileinput-exists .fileinput-new,.fileinput-new .fileinput-exists{display:none}.fileinput-inline .fileinput-controls{display:inline}.fileinput-filename{display:inline-block;overflow:hidden;vertical-align:middle}.form-control .fileinput-filename{vertical-align:bottom}.fileinput.input-group{display:table}.fileinput.input-group>*{position:relative;z-index:2}.fileinput.input-group>.btn-file{z-index:1}.fileinput-new.input-group .btn-file,.fileinput-new .input-group .btn-file{border-radius:0 4px 4px 0}.fileinput-new.input-group .btn-file.btn-xs,.fileinput-new .input-group .btn-file.btn-xs,.fileinput-new.input-group .btn-file.btn-sm,.fileinput-new .input-group .btn-file.btn-sm{border-radius:0 3px 3px 0}.fileinput-new.input-group .btn-file.btn-lg,.fileinput-new .input-group .btn-file.btn-lg{border-radius:0 6px 6px 0}.form-group.has-warning .fileinput .fileinput-preview{color:#8a6d3b}.form-group.has-warning .fileinput .thumbnail{border-color:#faebcc}.form-group.has-error .fileinput .fileinput-preview{color:#a94442}.form-group.has-error .fileinput .thumbnail{border-color:#ebccd1}.form-group.has-success .fileinput .fileinput-preview{color:#3c763d}.form-group.has-success .fileinput .thumbnail{border-color:#d6e9c6}.input-group-addon:not(:first-child){border-left:0}
</style>

<div class=\"control-group\"> 
<div class=\"controls controls-row\"> 
  <div style=\"max-width: 200px;\" class=\"fileinput fileinput-new\" data-provides=\"fileinput\">
   <label for=\"avatar_upload_file\" class=\"control-label fileinput-exists\">";
        // line 8
        echo $this->env->getExtension('phpbb')->lang("PREVIEW");
        echo $this->env->getExtension('phpbb')->lang("COLON");
        echo "</label>
\t  <div class=\"fileinput-preview fileinput-exists thumbnail\" style=\"max-width: 200px; max-height: 150px;\"></div>
\t   <div>
\t\t<span class=\"btn btn-default btn-file\">
\t\t<span class=\"fileinput-new\"><i class=\"fa fa-picture-o\"></i>&nbsp;";
        // line 12
        echo $this->env->getExtension('phpbb')->lang("SELECT_IMAGE");
        echo "</span>
\t\t<span class=\"fileinput-exists\">";
        // line 13
        echo $this->env->getExtension('phpbb')->lang("CHANGE");
        echo "</span>
\t\t <input type=\"hidden\" name=\"MAX_FILE_SIZE\" value=\"";
        // line 14
        echo (isset($context["AVATAR_UPLOAD_SIZE"]) ? $context["AVATAR_UPLOAD_SIZE"] : null);
        echo "\" />
\t\t  <input type=\"file\" name=\"avatar_upload_file\" id=\"avatar_upload_file\" class=\"default\">
\t\t</span>
\t\t<a href=\"#\" title=\"";
        // line 17
        echo $this->env->getExtension('phpbb')->lang("DELETE_AVATAR");
        echo "\" class=\"btn btn-default fileinput-exists\" data-dismiss=\"fileinput\"><i class=\"fa fa-times\"></i></a>
\t   </div>
\t<div class=\"space10 fileinput-exists\"></div>\t
   <div class=\"help-block fileinput-exists\"><span class=\"label label-info\">";
        // line 20
        echo $this->env->getExtension('phpbb')->lang("NOTE");
        echo "</span>&nbsp;";
        echo $this->env->getExtension('phpbb')->lang("UCP_SUBMIT_TO_UPLOAD");
        echo "</div>
  </div>
</div>
</div>

    ";
        // line 25
        if ((isset($context["S_UPLOAD_AVATAR_URL"]) ? $context["S_UPLOAD_AVATAR_URL"] : null)) {
            echo "   
\t  <div class=\"control-group\">
      <label for=\"avatar_upload_url\" class=\"control-label\">";
            // line 27
            echo $this->env->getExtension('phpbb')->lang("UPLOAD_AVATAR_URL");
            echo "</label><span class=\"help-block\">";
            echo $this->env->getExtension('phpbb')->lang("UPLOAD_AVATAR_URL_EXPLAIN");
            echo "</span>
        <div class=\"controls controls-row\"> 
             <input type=\"url\" name=\"avatar_upload_url\" id=\"avatar_upload_url\" value=\"\" class=\"form-control\" placeholder=\"http://the-avatar-site/avatar.gif\">
        </div>
      </div>
\t";
        }
        // line 33
        echo "

";
    }

    public function getTemplateName()
    {
        return "ucp_avatar_options_upload.html";
    }

    public function isTraitable()
    {
        return false;
    }

    public function getDebugInfo()
    {
        return array (  82 => 33,  71 => 27,  66 => 25,  56 => 20,  50 => 17,  44 => 14,  40 => 13,  36 => 12,  28 => 8,  19 => 1,);
    }
}
