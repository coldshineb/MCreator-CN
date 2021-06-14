File ${field$var} = new File(${input$location}, File.separator + ${input$name});
<#if field$createFile?lower_case == "true">
<#if field$isDirectory?lower_case == "true">
${field$var}.mkdirs();
<#else>
if (!${field$var}.exists()) {
  try {
    ${field$var}.createNewFile();
  } catch (IOException exception) {
    exception.printStackTrace();
  }
}
	</#if>
</#if>