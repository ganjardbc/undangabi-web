<template>
  <div id="AppPlaySong" class="theme-play-song">
    <button class="theme-play-button" @click="onClickPlay">
      <div class="song-action">
        <i
          :class="`song-icon fa fa-lw ${isPlayed ? 'fa-pause' : 'fa-play'}`"
        ></i>
        <div class="song-caption">
          <div class="song-title">
            {{ isPlayed ? 'Pause' : 'Play' }}
          </div>
          <div class="song-name">
            {{ label || 'Song' }}
          </div>
        </div>
      </div>
    </button>
  </div>
</template>
<script>
export default {
  name: 'AppPlaySong',
  props: {
    label: {
      default: null,
    },
    isPlayed: {
      default: true,
    },
  },
  methods: {
    onClickPlay() {
      if (this.isPlayed) {
        this.$emit('pauseAudio')
      } else {
        this.$emit('playAudio')
      }
    },
  },
}
</script>
