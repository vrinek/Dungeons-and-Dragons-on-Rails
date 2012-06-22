require 'spec_helper'

describe InsiderDatum do
  context "when a matching datum already exists" do
    let(:type) { "a type" }
    let(:id) { 42 }

    let!(:existing) do
      FactoryGirl.create :insider_datum, data_type: type, original_id: id
    end

    it "should not hit Ravenloft" do
      Ravenloft::Manager.any_instance.should_not_receive(:login!)

      InsiderDatum.fetch(type, id)
    end
  end

  context "when no matching datum exists" do
    let(:type) { "a type" }
    let(:id) { 42 }

    it "should hit Ravenloft" do
      Ravenloft::Manager.any_instance.should_receive(:login!)
      Ravenloft::Manager.any_instance.should_receive(:get).and_return("some html")

      InsiderDatum.fetch(type, id)
    end

    it "should cache the result to the database" do
      Ravenloft::Manager.any_instance.stub(:login!)
      Ravenloft::Manager.any_instance.stub(:get).and_return("some html")

      expect {
        InsiderDatum.fetch(type, id)
      }.to change {
        InsiderDatum.count
      }.by(1)
    end
  end

  context "when created (callbacks)" do
    let(:html) do
      <<-HTML
        <h1 class="mihead">
          Flaming Weapon
          <span class="milevel" id="headerlevel">Level 5+ Uncommon</span>
        </h1>
        <p class="miflavor">You can will this weapon to burst into flame.</p>
        <table class="magicitem">
          <tr>
            <td class="mic1">Lvl 5</td>
            <td class="mic2">+1</td>
            <td class="mic3">1,000 gp</td>
            <td class="mic4"> </td>
            <td class="mic1">Lvl 20</td>
            <td class="mic2">+4</td>
            <td class="mic3">125,000 gp</td>
          </tr>
          <tr>
            <td class="mic1">Lvl 10</td>
            <td class="mic2">+2</td>
            <td class="mic3">5,000 gp</td>
            <td class="mic4"> </td>
            <td class="mic1">Lvl 25</td>
            <td class="mic2">+5</td>
            <td class="mic3">625,000 gp</td>
          </tr>
          <tr>
            <td class="mic1">Lvl 15</td>
            <td class="mic2">+3</td>
            <td class="mic3">25,000 gp</td>
            <td class="mic4"> </td>
            <td class="mic1">Lvl 30</td>
            <td class="mic2">+6</td>
            <td class="mic3">3,125,000 gp</td>
          </tr>
        </table>
        <p class="mistat"><b>Weapon: </b>Any</p>
        <p class="mistat">
          <b>Enhancement Bonus:</b> attack rolls and damage rolls
        </p>
        <p class="mistat indent"><b>Critical:</b> +1d6 fire damage per plus</p>
        <h2 class="mihead">
          Power (Fire)
          <img src="http://www.wizards.com/dnd/images/symbol/x.gif">
          (Free Action)
        </h2>
        <p class="mistat indent">
          All untyped damage dealt by this weapon changes to fire damage.
          Another free action returns the damage to normal.
        </p>
        <h2 class="mihead">
          Power (Fire)
          <img src="http://www.wizards.com/dnd/images/symbol/x.gif">
          Daily (Free Action)
        </h2>
        <p class="mistat indent1"><i>Trigger:</i> You hit with the weapon.</p>
        <p class="mistat indent1">
          <i>Effect:</i>
          The attack deals 1d6 extra fire damage, and the target takes
          ongoing 5 fire damage (save ends).
        </p>
        <p class="mistat indent1">
          <i>Level 15 or 20:</i> 2d6 extra fire damage.
        </p>
        <p class="mistat indent1">
          <i>Level 25 or 30:</i> 3d6 extra fire damage.
        </p>
        <br><br>
        <p class="publishedIn">
          Published in
          <a href="http://www.wizards.com/default.asp?x=products/dndacc/217367200" target="_new">
            Player's Handbook
          </a>, page(s) 234,
          <a href="http://www.wizards.com/dnd/Product.aspx?x=dnd/products/dndacc/244640000" target="_new">
            Dungeon Master's Kit
          </a>, page(s) 257.
        </p>
      HTML
    end

    let(:datum) do
      FactoryGirl.build :insider_datum, html: html
    end

    before do
      datum.save
    end

    it "should localize the images' src urls" do
      datum.html.scan(/src="([^"]+)"/).flatten.uniq.each do |url|
        url.should =~ %r[^/images/insider_data/[^/]+$]
      end
    end
  end
end
