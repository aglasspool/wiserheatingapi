% rebase('base.tpl')
<meta http-equiv="refresh" content="5; url=/" />
<div class="max-w-screen-xl mx-auto p-5 sm:p-10 md:p-16">
    <div class="grid grid-cols-1 md:grid-cols-3 sm:grid-cols-2 gap-10">

 <div class="rounded overflow-hidden shadow-lg bg-[#C1E1C1]">
            <a href="#"></a>
            <div class="relative">
                <a href="#">
                    <img class="w-full"
                        src="static/images/fieldingstreet.jpg"
                        alt="Fielding Street">
                    <div
                        class="hover:bg-transparent transition duration-300 absolute bottom-0 top-0 right-0 left-0 bg-gray-900 opacity-25">
                    </div>
                </a>
               

                
                    <div
                        class="text-sm absolute top-0 right-0 bg-indigo-600 px-4 text-white rounded-full h-16 w-16 flex flex-col items-center justify-center mt-3 mr-3 hover:bg-white hover:text-indigo-600 transition duration-500 ease-in-out">
                        <span class="font-bold">{{current_temperature}}°</span>
                        <small>London</small>
                    </div>
                
            </div>
            <div class="px-6 py-4 bg-[#FFC5D3]">

                <a href="#"
                    class="font-semibold text-lg inline-block hover:text-indigo-600 transition duration-500 ease-in-out">HEATING BOOSTED!</a>
                    % if defined('ip'):
<p class="text-gray-500 text-sm">Heating boosted by {{ ip }} on {{ start }}</p>
                    % end
               
            </div>
            
        </div>

   </div>
</div>