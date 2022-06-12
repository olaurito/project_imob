<?php

namespace LaraDev\Http\Controllers\Web;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Mail;
use LaraDev\Http\Controllers\Controller;
use LaraDev\Mail\Web\Contact;
use LaraDev\Property;

class WebController extends Controller
{
    public function home()
    {
        $head = $this->seo->render(
            env('APP_NAME') . ' - Upinside Treinamentos',
            'Encontre o imóvel dos seus sonhos na melhor e mais completa imobiliária do Sul da ilha de Florianópolis',
            route('web.home'),
            asset('frontend/assets/images/realty.jpeg')
        );

        $propertiesForSale = Property::sale()->available()->limit(3)->get();
        $propertiesForRent = Property::rent()->available()->limit(3)->get();
      /*   dd($propertiesForRent); */
        return view('web.home', [
            'head' => $head,
            'propertiesForSale' => $propertiesForSale,
            'propertiesForRent' => $propertiesForRent
        ]);

    }

    public function spotlight()
    {
        $head = $this->seo->render(
            env('APP_NAME') . ' - Upinside Treinamentos',
            'Confira nossos maiores empreendimentos e lançamentos no sul da oçha de Floripa',
            route('web.spotlight'),
            asset('frontend/assets/images/realty.jpeg')
        );

        return view('web.spotlight', [
            'head' => $head
        ]);
    }

    public function rent()
    {
        $head = $this->seo->render(
            env('APP_NAME') . ' - Upinside Treinamentos',
            'Alugue o imóvel dos seus sonhos na melhor e mais completa imobiliária do Sul da ilha de Florianópolis',
            route('web.rent'),
            asset('frontend/assets/images/realty.jpeg')
        );

        $filter = new FilterController();
        $filter->clearAllData();

        $properties = Property::rent()->available()->get();
        return view('web.filter',[
            'head' => $head,
            'properties' => $properties,
            'type' => 'rent'
        ]);
    }

    public function buy()
    {
        $head = $this->seo->render(
            env('APP_NAME') . ' - Upinside Treinamentos',
            'Compre o imóvel dos seus sonhos na melhor e mais completa imobiliária do Sul da ilha de Florianópolis',
            route('web.buy'),
            asset('frontend/assets/images/realty.jpeg')
        );


        $filter = new FilterController();
        $filter->clearAllData();

        $properties = Property::rent()->available()->get();
        return view('web.filter',[
            'head' => $head,
            'properties' => $properties,
            'type' => 'sale'
        ]);
    }

    public function rentProperty(Request $request)
    {
        $property = Property::where('slug', $request->slug)->first();

        $head = $this->seo->render(
            env('APP_NAME') . ' - Upinside Treinamentos',
            $property->headline ?? $property->title,
            route('web.rentProperty', ['property' => $property->slug]),
            $property->cover());

        return view('web.property', [
            'head' => $head,
            'property' => $property,
            'type' => 'rent'
        ]);
        /* dd($property); */
       /*  var_dump($request->slug); */
    }

    public function buyProperty(Request $request)
    {
        $property = Property::where('slug', $request->slug)->first();

        $head = $this->seo->render(
            env('APP_NAME') . ' - Upinside Treinamentos',
            $property->headline ?? $property->title,
            route('web.buyProperty', ['property' => $property->slug]),
            $property->cover());


        return view('web.property', [
            'head' => $head,
            'property' => $property,
            'type' => 'sale'
        ]);
       /*  var_dump($request->slug); */
    }

    public function filter()
    {
        $head = $this->seo->render(
            env('APP_NAME') . ' - Upinside Treinamentos',
            'Compre ou alugue o imóvel dos seus sonhos na melhor e mais completa imobiliária do Sul da ilha de Florianópolis',
            route('web.filter'),
            asset('frontend/assets/images/realty.jpeg')
        );


        $filter = new FilterController();
        $itemProperties = $filter->createQuery('id');

        foreach($itemProperties as $property){
            $properties[] = $property->id; //a variavel passa a ser um vetor e agora usaará um eloquent
        }

        if(!empty($properties)){
            $properties = Property::whereIn('id', $properties)->get();
        }else{
            $properties = Property::all();
        }

/*         dd($properties);
 */
        return view('web.filter', [
            'head' => $head,
            'properties' => $properties
        ]);
    }

    public function experience()
    {
        $head = $this->seo->render(
            env('APP_NAME') . ' - Upinside Treinamentos',
            'Viva a experiencia de encontrar o imóvel dos seus sonhos na melhor e mais completa imobiliária do Sul da ilha de Florianópolis',
            route('web.home'),
            asset('frontend/assets/images/realty.jpeg')
        );

        $filter = new FilterController();
        $filter->clearAllData(); /* limpar o filter */

        /* pegar todos os imoveis que pertencem  a experiencia */
        $properties = Property::whereNotNull('experience')->get();

        return view('web.filter', [
            'head' => $head,
            'properties' => $properties
        ]);
    }

    public function experienceCategory(Request $request)
    {


        $filter = new FilterController();
        $filter->clearAllData(); /* limpar o filter */

        if($request->slug == 'cobertura'){
            $properties = Property::where('experience', 'Cobertura')->get();

            $head = $this->seo->render(
                env('APP_NAME') . ' - Upinside Treinamentos',
                'Viva a experiencia de morar na cobertura...',
                route('web.experienceCategory', ['category' => 'Cobertura']),
                asset('frontend/assets/images/realty.jpeg')
            );

        }elseif($request->slug == 'alto-padrao'){
            $properties = Property::where('experience', 'Alto Padráo')->get();

            $head = $this->seo->render(
                env('APP_NAME') . ' - Upinside Treinamentos',
                'Viva a experiencia de morar num imovel de alto padrão...',
                route('web.experienceCategory', ['category' => 'Alto Padrão']),
                asset('frontend/assets/images/realty.jpeg')
            );

        }elseif($request->slug == 'de-frente-para-o-mar'){
            $properties = Property::where('experience', 'De frente para o Mar')->get();
        }elseif($request->slug == 'condominio-fechado'){
            $properties = Property::where('experience', 'Condomínio Fechado')->get();
        }elseif($request->slug == 'compacto'){
            $properties = Property::where('experience', 'Compacto')->get();
        }elseif($request->slug == 'lojas-e-salas'){
            $properties = Property::where('experience', 'Lojas e Salas')->get();
        }else{
            $properties = Property::whereNotNull('experience')->get();
        }

        if(empty($head)){
            $head = $this->seo->render(
                env('APP_NAME') . ' - Upinside Treinamentos',
                'Viva a experiencia de morar na praia em umas das capitais mais bonitas do br',
                route('web.experience'),
                asset('frontend/assets/images/realty.jpeg')
            );
        }

        return view('web.filter', [
            'head' => $head,
            'properties' => $properties
        ]);
    }

    public function contact()
    {
        $head = $this->seo->render(
            env('APP_NAME') . ' - Upinside Treinamentos',
            'Quer conversar com um corretor exclusivo e ter o atendimento diferenciado em busca do seu imóvel dos sonhos? Entre em contato com a nossa equipe',
            route('web.contact'),
            asset('frontend/assets/images/realty.jpeg')
        );

        return view('web.contact', [
            'head' => $head
        ]);
    }

    public function sendEmail(Request $request)
    {

        $data = [
            'reply_name' => $request->name,
            'reply_email' => $request->email,
            'cell' => $request->cell,
            'message' => $request->message
        ];

        Mail::send(new Contact($data));

        return redirect()->route('web.sendEmailSuccess');

        /* return new Contact($data); */

        /* dd($data); */
    }

    public function sendEmailSuccess()
    {
        return view('web.contact_success');
    }

}
