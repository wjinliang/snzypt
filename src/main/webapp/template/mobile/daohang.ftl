
<div class="menu">
    <li>
    <div class="ub pd-a2">
    	<@channelDirective channelId=21 ><div class="ub"><a href="${channel.url}">${channel.displayName}&nbsp;&gt;</a></div></@channelDirective>
       <div class="ub ub-f1 ub-ver">
        <@channelListDirective channelId=21>
       		<div class="ub">
             <#list channels as channel>
                <#if channel_index &lt; 3>
                 <div class="ubw1"><a href="${channel.url}">${channel.displayName}</a></div>
                </#if> 
             </#list>
           </div>
           <div class="ub">
             <#list channels as channel>
               <#if channel_index &gt; 2 && channel_index &lt; 6>
               <div class="ubw1"><a href="${channel.url}">${channel.displayName}</a></div>
               </#if> 
             </#list>
           </div>
            <div class="ub">
             <#list channels as channel>
               <#if channel_index &gt; 5>
               <div class="ubw3"><a href="${channel.url}">${channel.displayName}</a></div>
               </#if> 
             </#list>
           </div>
        </@channelListDirective>
       </div>
    </div>
    </li>
    <li>
    <div class="ub pd-a2">
       <div class="ub ub-f1 ub-ver">
       		<div class="ub">
              <@channelDirective channelId=20><div class="ubw3"><a href="${channel.url}">${channel.displayName}</a></div></@channelDirective>
              <@channelDirective channelId=26 ><div class="ubw3"><a href="${channel.url}">${channel.displayName}</a></div></@channelDirective>
              <@channelDirective channelId=27><div class="ubw3"><a href="${channel.url}">${channel.displayName}</a></div></@channelDirective>
           </div>
           <div class="ub">
             <@channelDirective channelId=31 ><div class="ubw3"><a href="${channel.url}">${channel.displayName}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></div></@channelDirective>
             <@channelDirective channelId=32 ><div class="ubw3"><a href="${channel.url}">${channel.displayName}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></div></@channelDirective>
             <@channelDirective channelId=34><div class="ubw3"><a href="${channel.url}">${channel.displayName}</a></div></@channelDirective>
           </div>
       </div>
    </div>
    </li>
    <li>
    <div class="ub pd-a2">
    	<@channelDirective channelId=28><div class="ub"><a href="${channel.url}">${channel.displayName}&nbsp;&gt;</a></div></@channelDirective>
       <div class="ub ub-f1 ub-ver">
       		<div class="ub">
            <@channelListDirective channelId=28>
             <#list channels as channel>
            <#if channel_index &lt; 3>
              <div class="ubw1"><a href="${channel.url}">${channel.displayName}</a></div>
               </#if> 
             </#list>
           </div>
           <div class="ub">
            <#list channels as channel>
            <#if channel_index &gt; 2>
             <div class="ubw2"><a href="${channel.url}">${channel.displayName}</a></div>
              </#if> 
             </#list>
           </div>
           </@channelListDirective>
       </div>
    </div>
    </li>
    <li>
    <div class="ub pd-a2">
    	<@channelDirective channelId=29><div class="ub"><a href="${channel.url}">${channel.displayName}&nbsp;&gt;</a></div></@channelDirective>
       <div class="ub ub-f1 ub-ver">
         <@channelListDirective channelId=29>
       		<div class="ub">
             <#list channels as channel>
             <#if channel_index &lt; 3>
             <div class="ubw1"><a href="${channel.url}">${channel.displayName}</a></div>
              </#if> 
             </#list>
           </div>
           <div class="ub">
             <#list channels as channel>
             <#if channel_index &gt; 2>
             <div class="ubw2"><a href="${channel.url}">${channel.displayName}</a></div>
              </#if> 
             </#list>
           </div>
       </div>
        </@channelListDirective>
    </div>
    </li>
    <li>
    <div class="ub pd-a2">
    	<@channelDirective channelId=66><div class="ub"><a href="${channel.url}">${channel.displayName}&nbsp;&gt;</a></div></@channelDirective>
       <div class="ub ub-f1 ub-ver">
        <@channelListDirective channelId=66>
       		<div class="ub">
           <#list channels as channel>
             <#if channel_index &lt; 4>
             <div class="ubw3"><a href="${channel.url}">${channel.displayName}</a></div>
             </#if> 
             </#list>
           </div>
           <div class="ub">
             <#list channels as channel>
             <#if channel_index &gt; 2>
             <div class="ub-f1"><a href="${channel.url}">${channel.displayName}</a></div>
              </#if> 
             </#list>
           </div>
       </div>
         </@channelListDirective>
 
    </div>
    </li>
    <li>
    <div class="ub pd-a2">
    	<@channelDirective channelId=67><div class="ub"><a href="${channel.url}">${channel.displayName}&nbsp;&gt;</a></div></@channelDirective>
       <div class="ub ub-f1 ub-ver">
         <@channelListDirective channelId=67>
       		<div class="ub">
             <#list channels as channel>
             <#if channel_index &lt; 4>
             <div class="ub-f1"><a href="${channel.url}">${channel.displayName}</a></div>
             </#if> 
             </#list>
           </div>
           <div class="ub">
              <#list channels as channel>
             <#if channel_index &gt; 3 && channel_index &lt; 8>
             <div class="ub-f1"><a href="${channel.url}">${channel.displayName}</a></div>
             </#if> 
             </#list>
           </div>
           <div class="ub">
            <#list channels as channel>
            <#if channel_index &gt; 7>
             <div class="ubw3"><a href="${channel.url}">${channel.displayName}</a></div>
           </#if> 
           </#list>
           </div>
       </div>
        </@channelListDirective>
    </div>
    </li>
    <li>
    <div class="ub pd-a2">
    	<@channelDirective channelId=68><div class="ub"><a href="${channel.url}">${channel.displayName}&nbsp;&gt;</a></div></@channelDirective>
        <@channelListDirective channelId=68>
       <div class="ub ub-f1 ub-ver">
       		<div class="ub">
             <#list channels as channel>
             <#if channel_index &lt; 4>
             <div class="ub-f1"><a href="${channel.url}">${channel.displayName}</a></div>
             </#if> 
             </#list>
           </div>
           <div class="ub">
              <#list channels as channel>
             <#if channel_index &gt; 3 && channel_index &lt; 8>
             <div class="ub-f1"><a href="${channel.url}">${channel.displayName}</a></div>
             </#if> 
             </#list>
           </div>
           <div class="ub">
            <#list channels as channel>
            <#if channel_index &gt; 7>
             <div class="ubw3"><a href="${channel.url}">${channel.displayName}</a></div>
           </#if> 
           </#list>
           </div>
       </div>
        </@channelListDirective>
    </div>
    </li>
</div>
