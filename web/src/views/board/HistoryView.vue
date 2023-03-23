<template>
  <main style="max-width: 768px; margin: auto">
    <h2>History</h2>
    <h2>Question</h2>
    <section class="text-left mt-6">
      <div
        v-for="index in [1, 2, 3, 4, 5, 6]"
        class="border-solid border-1 border-300 p-2"
        :key="index"
      >
        <div class="my-2 text-xs">保存日時: 2023-03-04 12:04:33</div>
        <div class="my-2">
          <b>質問：</b>
          <span>明日は晴れますか？</span>
        </div>
        <div class="my-2">
          <b>回答：</b>
          <span>明日は雨です</span>
        </div>
      </div>
    </section>
  </main>
</template>

<script setup lang="ts"></script>
