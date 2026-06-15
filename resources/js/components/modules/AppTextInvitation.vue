<template>
  <div id="App" class="width width-100">
    <AppTabs
      v-if="tabWedding.length > 0"
      :path="`text-invitation-${guestId}`"
      :selectedIndex="findTabWeddingIndex(selectedIndex)"
      :isScrollable="true"
      :isFull="true"
      :data="tabWedding"
      :onChange="(data) => onChangeTabs(data)"
      class="margin margin-bottom-15-px"
    />

    <div v-if="selectedIndex === 'wedding'">
      <div :id="`target-invitation-${guestId}`">
        <div>
          <span class="fonts fonts-10 black">Bismillahirrahmanirrahiim</span>
        </div>
        <br />

        <div>
          <b class="fonts fonts-10 black semibold"
            >*Assalamu’alaikum Warahmatullahi Wabarakaatuh*</b
          >
        </div>
        <br />

        <div>
          <span class="fonts fonts-10 black">Kepada Yth.</span><br />
          <span class="fonts fonts-10 black">Bapak/Ibu/Saudara/i</span><br />
          <b class="fonts fonts-10 black semibold">*{{ guestName }}*</b><br />
          <span v-if="guestAddress">
            <span class="fonts fonts-10 black">di</span>
            <b class="fonts fonts-10 black semibold">*{{ guestAddress }}*</b>
          </span>
        </div>
        <br />

        <div>
          <span class="fonts fonts-10 black"
            >Maha Suci Allah SWT dengan segala Kebesaran-Nya. Tanpa mengurangi
            rasa hormat, perkenankan kami menyampaikan kabar bahagia atas
            pernikahan kami :
          </span>
        </div>
        <br />

        <div>
          <b class="fonts fonts-10 black semibold">*{{ brides }}*</b>
        </div>
        <br />

        <div>
          <span class="fonts fonts-10 black"
            >yang InsyaAllah akan diselenggarakan pada :
          </span>
        </div>
        <br />

        <div v-if="location || date">
          <span class="fonts fonts-10 black"
            >Hari, tanggal : {{ date | moment('dddd, Do MMMM YYYY') }}</span
          ><br />
          <span v-if="location" class="fonts fonts-10 black"
            >Tempat : {{ location }}</span
          ><br />
        </div>
        <br v-if="location || date" />

        <div>
          <span class="fonts fonts-10 black"
            >Berikut merupakan link undangan kami :
          </span>
        </div>
        <br />

        <div>
          <a
            v-if="customLink"
            :href="`${customLink}`"
            target="_blank"
            class="fonts fonts-10"
            style="color: blue"
          >
            {{ `${customLink}` }}
          </a>
          <a
            v-else
            :href="`${initUrl}/${shortLink}/${guestId}`"
            target="_blank"
            class="fonts fonts-10"
            style="color: blue"
          >
            {{ `${initUrl}/${shortLink}/${guestId}` }}
          </a>
        </div>
        <br />

        <div>
          <span class="fonts fonts-10 black"
            >Merupakan suatu kebahagiaan bagi kami apabila Bapak/Ibu/Saudara/i
            berkenan untuk hadir dan memberikan doa restu di hari bahagia kami.
          </span>
        </div>
        <br />

        <div>
          <span class="fonts fonts-10 black">Terima kasih.</span>
        </div>
        <br />

        <div>
          <b class="fonts fonts-10 black"
            >*Wassalamualaikum Warahmatullahi Wabarakatuh*</b
          >
        </div>
        <br />

        <div>
          <span class="fonts fonts-10 black">Kami yang berbahagia,</span><br />
        </div>
        <br />

        <div>
          <b class="fonts fonts-10 black semibold">*{{ title }}*</b><br />
          <b v-if="tags" class="fonts fonts-10 black semibold">*{{ tags }}*</b>
        </div>
        <br />

        <div>
          <span class="fonts fonts-10 black"
            >(Simpan nomor jika link tidak dapat disentuh atau salin link ke
            browser untuk membuka undangan)</span
          >
        </div>
      </div>
    </div>

    <div v-if="selectedIndex === 'wedding-2'">
      <div :id="`target-invitation-${guestId}`">
        <div>
          <span class="fonts fonts-10 black">Bismillahirrahmanirrahiim</span>
        </div>
        <br />

        <div>
          <b class="fonts fonts-10 black semibold"
            >*Assalamu’alaikum Warahmatullahi Wabarakaatuh*</b
          >
        </div>
        <br />

        <div>
          <span class="fonts fonts-10 black">Kepada Yth.</span><br />
          <span class="fonts fonts-10 black">Bapak/Ibu/Saudara/i</span><br />
          <b class="fonts fonts-10 black semibold">*{{ guestName }}*</b><br />
          <span v-if="guestAddress">
            <span class="fonts fonts-10 black">di</span>
            <b class="fonts fonts-10 black semibold">*{{ guestAddress }}*</b>
          </span>
        </div>
        <br />

        <div>
          <span class="fonts fonts-10 black"
            >Maha Suci Allah SWT dengan segala Kebesaran-Nya. Tanpa mengurangi
            rasa hormat, perkenankan kami menyampaikan kabar bahagia atas
            pernikahan anak kami :
          </span>
        </div>
        <br />

        <div>
          <b class="fonts fonts-10 black semibold">*{{ brides }}*</b>
        </div>
        <br />

        <div>
          <span class="fonts fonts-10 black"
            >yang InsyaAllah akan diselenggarakan pada :
          </span>
        </div>
        <br />

        <div v-if="location || date">
          <span class="fonts fonts-10 black"
            >Hari, tanggal : {{ date | moment('dddd, Do MMMM YYYY') }}</span
          ><br />
          <span v-if="location" class="fonts fonts-10 black"
            >Tempat : {{ location }}</span
          ><br />
        </div>
        <br v-if="location || date" />

        <div>
          <span class="fonts fonts-10 black"
            >Berikut merupakan link undangan kami :
          </span>
        </div>
        <br />

        <div>
          <a
            v-if="customLink"
            :href="`${customLink}`"
            target="_blank"
            class="fonts fonts-10"
            style="color: blue"
          >
            {{ `${customLink}` }}
          </a>
          <a
            v-else
            :href="`${initUrl}/${shortLink}/${guestId}`"
            target="_blank"
            class="fonts fonts-10"
            style="color: blue"
          >
            {{ `${initUrl}/${shortLink}/${guestId}` }}
          </a>
        </div>
        <br />

        <div>
          <span class="fonts fonts-10 black"
            >Merupakan suatu kebahagiaan bagi kami apabila Bapak/Ibu/Saudara/i
            berkenan untuk hadir dan memberikan doa restu di hari bahagia
            keluarga kami.
          </span>
        </div>
        <br />

        <div>
          <span class="fonts fonts-10 black">Terima kasih.</span>
        </div>
        <br />

        <div>
          <b class="fonts fonts-10 black"
            >*Wassalamualaikum Warahmatullahi Wabarakatuh*</b
          >
        </div>
        <br />

        <div>
          <span class="fonts fonts-10 black">Kami yang berbahagia,</span><br />
        </div>
        <br />

        <div>
          <b class="fonts fonts-10 black semibold">*{{ title }}*</b><br />
          <b v-if="tags" class="fonts fonts-10 black semibold">*{{ tags }}*</b>
        </div>
        <br />

        <div>
          <span class="fonts fonts-10 black"
            >(Simpan nomor jika link tidak dapat disentuh atau salin link ke
            browser untuk membuka undangan)</span
          >
        </div>
      </div>
    </div>

    <div v-if="selectedIndex === 'wedding-3'">
      <div :id="`target-invitation-${guestId}`">
        <div>
          <b class="fonts fonts-10 black"
            >*Assalamu'alaikum warahmatullahi wabarakatuh*</b
          >
        </div>
        <br />

        <div>
          <span class="fonts fonts-10 black">Kepada Yth.</span><br />
          <span class="fonts fonts-10 black">Bapak/Ibu/Saudara/i</span><br />
          <b class="fonts fonts-10 black semibold">*{{ guestName }}*</b><br />
          <b v-if="guestAddress" class="fonts fonts-10 black semibold"
            >*{{ guestAddress }}*</b
          >
        </div>
        <div>_____________________</div>
        <br />

        <div>
          <span class="fonts fonts-10 black"
            >Tanpa mengurangi rasa hormat, perkenankan kami mengundang
            Bapak/Ibu/Saudara/i untuk menghadiri acara pernikahan kami.</span
          >
        </div>
        <br />

        <div>
          <b class="fonts fonts-10 black">Berikut link undangan kami</b>,
          <span class="fonts fonts-10 black"
            >untuk info lengkap dari acara, bisa kunjungi :</span
          >
        </div>
        <br />

        <div>
          <a
            v-if="customLink"
            :href="`${customLink}`"
            target="_blank"
            class="fonts fonts-10"
            style="color: blue"
          >
            {{ `${customLink}` }}
          </a>
          <a
            v-else
            :href="`${initUrl}/${shortLink}/${guestId}`"
            target="_blank"
            class="fonts fonts-10"
            style="color: blue"
          >
            {{ `${initUrl}/${shortLink}/${guestId}` }}
          </a>
        </div>
        <br />

        <div>
          <span class="fonts fonts-10 black"
            >Merupakan suatu kebahagiaan bagi kami apabila Bapak/Ibu/Saudara/i
            berkenan untuk hadir dan memberikan doa restu.</span
          >
        </div>
        <br />

        <div>
          <span class="fonts fonts-10 black">Kami yang berbahagia,</span><br />
          <b class="fonts fonts-10 black semibold">*{{ title }}*</b>
        </div>
        <br />

        <div>
          <b class="fonts fonts-10 black"
            >*Wassalamualaikum Warahmatullahi Wabarakatuh*</b
          >
        </div>
        <br v-if="tags" />

        <div v-if="tags">
          <b class="fonts fonts-10 black semibold">*{{ tags }}*</b>
        </div>

        <div>_____________________</div>
        <br />

        <div>
          <span class="fonts fonts-10 black"
            >(Simpan nomor jika link tidak dapat disentuh atau salin link ke
            browser untuk membuka undangan)</span
          >
        </div>
      </div>
    </div>

    <div v-if="selectedIndex === 'engagement'">
      <div :id="`target-invitation-${guestId}`">
        <div>
          <span class="fonts fonts-10 black">Bismillahirrahmanirrahim</span
          ><br />
          <span class="fonts fonts-10 black"
            >Assalamu'alaikum warahmatullahi wabarakatuh.</span
          >
        </div>
        <br />

        <div>
          <span class="fonts fonts-10 black"
            >Dengan memohon limpahan Rahmat & Ridho Allah SWT, tanpa mengurangi
            rasa hormat, melalui media ini perkenankan kami mengundang
            <b class="fonts fonts-10 black semibold">*{{ guestName }}*</b> untuk
            menghadiri acara pertunangan kami,</span
          >
        </div>
        <br />

        <div>
          <b class="fonts fonts-10 black semibold">*{{ brides }}*</b>
        </div>
        <br />

        <div>
          <span class="fonts fonts-10 black"
            >Merupakan suatu kebahagiaan bagi kami apabila Bapak/Ibu/Saudara/i
            berkenan untuk hadir dan memberikan doa restu.</span
          >
        </div>
        <br />

        <div>
          <span class="fonts fonts-10 black"
            >Untuk info lebih lengkap terkait acara pertunangan kami, silahkan
            untuk membuka link undangan berikut :</span
          >
        </div>
        <br />

        <div>
          <a
            v-if="customLink"
            :href="`${customLink}`"
            target="_blank"
            class="fonts fonts-10"
            style="color: blue"
          >
            {{ `${customLink}` }}
          </a>
          <a
            v-else
            :href="`${initUrl}/${shortLink}/${guestId}`"
            target="_blank"
            class="fonts fonts-10"
            style="color: blue"
          >
            {{ `${initUrl}/${shortLink}/${guestId}` }}
          </a>
        </div>
        <br />

        <div>
          <span class="fonts fonts-10 black"
            >Terimakasih atas perhatiannya.</span
          >
        </div>
        <br />

        <div>
          <span class="fonts fonts-10 black">Kami yang berbahagia,</span><br />
          <b class="fonts fonts-10 black semibold">*{{ title }}*</b>
        </div>
        <br />

        <div v-if="tags">
          <b class="fonts fonts-10 black semibold">*{{ tags }}*</b>
        </div>
        <br />

        <div>
          <span class="fonts fonts-10 black"
            >(Simpan nomor jika link tidak dapat disentuh atau salin link ke
            browser untuk membuka undangan)</span
          >
        </div>
      </div>
    </div>

    <div v-if="selectedIndex === 'khitan'">
      <div :id="`target-invitation-${guestId}`">
        <div>
          <span class="fonts fonts-10 black">Bismillahirrahmanirrahiim</span>
        </div>
        <br />

        <div>
          <b class="fonts fonts-10 black semibold"
            >*Assalamu’alaikum Warahmatullahi Wabarakaatuh*</b
          >
        </div>
        <br />

        <div>
          <span class="fonts fonts-10 black">Kepada Yth.</span><br />
          <span class="fonts fonts-10 black">Bapak/Ibu/Saudara/i</span><br />
          <b class="fonts fonts-10 black semibold">*{{ guestName }}*</b><br />
          <span v-if="guestAddress">
            <span class="fonts fonts-10 black">di</span>
            <b class="fonts fonts-10 black semibold">*{{ guestAddress }}*</b>
          </span>
        </div>
        <br />

        <div>
          <span class="fonts fonts-10 black"
            >Tanpa mengurangi rasa hormat, perkenankan kami mengundang
            Bapak/Ibu/Saudara/i untuk menghadiri Acara Syukuran Walimatul Khitan
            Anak tercinta kami :
          </span>
        </div>
        <br />

        <div>
          <b class="fonts fonts-10 black semibold">*{{ brides }}*</b>
        </div>
        <br />

        <div>
          <span class="fonts fonts-10 black"
            >yang InsyaAllah akan diselenggarakan pada :
          </span>
        </div>
        <br />

        <div v-if="location || date">
          <span class="fonts fonts-10 black"
            >Hari, tanggal : {{ date | moment('dddd, Do MMMM YYYY') }}</span
          ><br />
          <span v-if="location" class="fonts fonts-10 black"
            >Tempat : {{ location }}</span
          ><br />
        </div>
        <br v-if="location || date" />

        <div>
          <span class="fonts fonts-10 black"
            >Berikut merupakan link undangan kami :
          </span>
        </div>
        <br />

        <div>
          <a
            v-if="customLink"
            :href="`${customLink}`"
            target="_blank"
            class="fonts fonts-10"
            style="color: blue"
          >
            {{ `${customLink}` }}
          </a>
          <a
            v-else
            :href="`${initUrl}/${shortLink}/${guestId}`"
            target="_blank"
            class="fonts fonts-10"
            style="color: blue"
          >
            {{ `${initUrl}/${shortLink}/${guestId}` }}
          </a>
        </div>
        <br />

        <div>
          <span class="fonts fonts-10 black"
            >Merupakan suatu kebahagiaan bagi kami apabila Bapak/Ibu/Saudara/i
            berkenan untuk hadir dan memberikan doa restu sebelum dan
            sesudahnya.
          </span>
        </div>
        <br />

        <div>
          <span class="fonts fonts-10 black">Terima kasih.</span>
        </div>
        <br />

        <div>
          <b class="fonts fonts-10 black"
            >*Wassalamualaikum Warahmatullahi Wabarakatuh*</b
          >
        </div>
        <br />

        <div>
          <b v-if="tags" class="fonts fonts-10 black semibold">*{{ tags }}*</b>
        </div>
        <br />

        <div>
          <span class="fonts fonts-10 black"
            >(Simpan nomor jika link tidak dapat disentuh atau salin link ke
            browser untuk membuka undangan)</span
          >
        </div>
      </div>
    </div>

    <div v-if="selectedIndex === 'event'">
      <div :id="`target-invitation-${guestId}`">
        <div>
          <b class="fonts fonts-10 black semibold">*Kepada {{ guestName }}*</b
          ><br />
          <b v-if="guestAddress" class="fonts fonts-10 black semibold"
            >*{{ guestAddress }}*</b
          >
        </div>
        <br />

        <div>
          <span class="fonts fonts-10 black"
            >Undangan ini merupakan undangan resmi dari kami,</span
          >
        </div>
        <br />

        <div>
          <span class="fonts fonts-10 black"
            >Tanpa mengurangi rasa hormat, perkenankan kami mengundang
            Bapak/Ibu/Saudara/i, teman sekaligus sahabat, untuk menghadiri acara
            kami :</span
          >
        </div>
        <br />

        <div>
          <b class="fonts fonts-10 black semibold">*{{ brides }}*</b>
        </div>
        <br />

        <div>
          <span class="fonts fonts-10 black"
            >Berikut link untuk info lengkap dari acara kami :</span
          >
        </div>
        <br />

        <div>
          <a
            v-if="customLink"
            :href="`${customLink}`"
            target="_blank"
            class="fonts fonts-10"
            style="color: blue"
          >
            {{ `${customLink}` }}
          </a>
          <a
            v-else
            :href="`${initUrl}/${shortLink}/${guestId}`"
            target="_blank"
            class="fonts fonts-10"
            style="color: blue"
          >
            {{ `${initUrl}/${shortLink}/${guestId}` }}
          </a>
        </div>
        <br />

        <div>
          <span class="fonts fonts-10 black"
            >Merupakan suatu kebahagiaan bagi kami apabila Bapak/Ibu/Saudara/i
            berkenan untuk hadir dan memberikan do'a.</span
          >
        </div>
        <br />

        <div>
          <b class="fonts fonts-10 black semibold">*Terimakasih.*</b>
        </div>
        <br />

        <div>
          <span class="fonts fonts-10 black">Hormat kami,</span><br />
          <b class="fonts fonts-10 black semibold"
            >*Admin Acara: {{ title }}*</b
          >
        </div>
        <br />

        <div v-if="tags">
          <b class="fonts fonts-10 black semibold">*{{ tags }}*</b>
        </div>
        <br />

        <div>
          <span class="fonts fonts-10 black"
            >(Simpan nomor jika link tidak dapat disentuh atau salin link ke
            browser untuk membuka undangan)</span
          >
        </div>
      </div>
    </div>

    <div
      style="
        position: sticky;
        bottom: 0;
        padding-bottom: 15px;
        margin-top: 30px;
      "
      class="bg-wite width width-full"
    >
      <button
        v-if="!disabledButtonCopy"
        class="btn btn-sekunder btn-full box-shadow"
        @click="onCopyInvitation(`target-invitation-${guestId}`, guestName)"
      >
        <i class="icn icn-left fa fa-lg fa-copy"></i> Salin Kalimat Undangan
      </button>
      <!-- <button 
                v-if="guestPhone"
                class="btn btn-sekunder btn-full" 
                style="margin-top: 15px;"
                @click="onSendInvitation(`target-invitation-${guestId}`, guestPhone)">
                <i class="icn icn-left fab fa-lg fa-whatsapp"></i> Kirim ke WhatsApp
            </button> -->
    </div>
  </div>
</template>
<script>
import { mapActions } from 'vuex'
import AppTabs from './AppTabs'

const engagement = [{ id: 1, label: 'Pertunangan', status: 'active' }]

const event = [{ id: 1, label: 'Acara', status: 'active' }]

export default {
  name: 'App',
  data() {
    return {
      tabEngagement: engagement,
      tabEvent: event,
      selectedIndex: '',
    }
  },
  props: {
    title: null,
    brides: null,
    tags: null,
    location: null,
    date: null,
    shortLink: null,
    category: null,
    guestId: null,
    guestName: null,
    guestAddress: null,
    guestPhone: null,
    disabledButtonCopy: {
      default: false,
    },
    customLink: null,
    categoryId: null,
  },
  components: {
    AppTabs,
  },
  computed: {
    tabWedding() {
      if (this.categoryId === 1) {
        this.selectedIndex = 'wedding'
        return [
          { id: 'wedding', label: 'Pernikahan 1', status: 'active' },
          { id: 'wedding-2', label: 'Pernikahan 2', status: '' },
          { id: 'wedding-3', label: 'Pernikahan 3', status: '' },
        ]
      } else if (this.categoryId === 8) {
        this.selectedIndex = 'engagement'
        return []
      } else if (this.categoryId === 9) {
        this.selectedIndex = 'khitan'
        return []
      } else {
        this.selectedIndex = 'event'
        return []
      }
    },
  },
  methods: {
    ...mapActions({
      setToast: 'toast/setToast',
    }),
    generateTitle(value) {
      return `*${value.replace(/&/g, '<br /> & <br />')}*`
    },
    makeToast(title) {
      const payload = {
        visible: true,
        title: title,
      }
      this.setToast(payload)
    },
    findTabWeddingIndex(id) {
      return this.tabWedding.findIndex((item) => item.id === id)
    },
    onChangeTabs(data) {
      this.selectedIndex = this.tabWedding[data].id
    },
    onCopyInvitation(id, name) {
      var range = document.createRange()
      range.selectNode(document.getElementById(id))
      window.getSelection().removeAllRanges()
      window.getSelection().addRange(range)

      try {
        var successful = document.execCommand('copy')
        var msg = successful ? 'berhasil' : 'tidak dapat'
        this.$message(`Undangan ${name} ${msg} di salin`)
      } catch (err) {
        this.$message('Oops, undangan tidak dapat di salin')
      }

      window.getSelection().removeAllRanges()
    },
    onSendInvitation(id, phone) {
      var element = document.getElementById(id)
      var text = element.innerText
      var url = `https://wa.me/${phone}?text="${text}"`
      console.log('onSendInvitation', url)

      window.open(url, '_blank')
    },
  },
}
</script>
