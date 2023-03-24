<template>
  <main style="max-width: 768px; margin: auto">
    <h2>History</h2>
    <section v-if="data" class="text-left mt-6">
      <div
        v-for="answerHistory in data.currentUser.answerHistories"
        class="border-solid border-1 border-700 p-3 mt-4"
        :key="answerHistory.id"
      >
        <div class="text-xs">保存日時: {{ answerHistory.createdAt }}</div>
        <hr />
        <div class="my-3">
          <b>■ 質問</b>
          <br />
          <span class="mt-1">{{ answerHistory.question }}</span>
        </div>
        <hr />
        <div class="my-3" style="white-space: pre-wrap">
          <b>■ 回答</b>
          <br />
          <span class="mt-1">{{ answerHistory.answer }}</span>
        </div>
      </div>
    </section>
  </main>
</template>

<script setup lang="ts">
import { useCurrentUserQuery } from '@/auto_generated/graphql'

const { _fetching, _error, data } = useCurrentUserQuery({
  context: { additionalTypenames: ['AnswerHistory'] }
})
</script>
